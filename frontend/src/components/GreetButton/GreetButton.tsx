import { Alert, Button, Card, Flex, Typography } from 'antd'
import { useState } from 'react'
import { createGreeting, type Greeting } from './GreetButton.api'

export const GreetButton = () => {
  const [loading, setLoading] = useState(false)
  const [greeting, setGreeting] = useState<Greeting | null>(null)
  const [error, setError] = useState<string | null>(null)

  const onClick = async () => {
    setLoading(true)
    setError(null)
    try {
      setGreeting(await createGreeting())
    } catch (e) {
      setGreeting(null)
      setError(e instanceof Error ? e.message : 'Something went wrong')
    } finally {
      setLoading(false)
    }
  }

  return (
    <Flex vertical align="center" gap="middle" style={{ width: '100%', maxWidth: 480 }}>
      <Button type="primary" size="large" loading={loading} onClick={onClick}>
        Press to Greet
      </Button>
      {greeting && (
        <Card title={`Greeting #${greeting.id}`} style={{ width: '100%' }}>
          <Typography.Paragraph style={{ marginBottom: 0 }}>{greeting.greeting}</Typography.Paragraph>
        </Card>
      )}
      {error && <Alert type="error" showIcon title={error} style={{ width: '100%' }} />}
    </Flex>
  )
}
