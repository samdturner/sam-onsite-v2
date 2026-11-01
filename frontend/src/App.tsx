import { Flex, Layout, Typography } from 'antd'
import { GreetButton } from './components/GreetButton/GreetButton'

export default function App() {
  return (
    <Layout style={{ minHeight: '100vh' }}>
      <Layout.Content>
        <Flex vertical align="center" justify="center" gap="large" style={{ minHeight: '100vh', padding: 24 }}>
          <Typography.Title level={2}>Welcome to the Greeter App</Typography.Title>
          <GreetButton />
        </Flex>
      </Layout.Content>
    </Layout>
  )
}
