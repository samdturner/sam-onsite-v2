export type Greeting = {
  id: number
  greeting: string
}

export const createGreeting = async (): Promise<Greeting> => {
  const response = await fetch('/api/greetings', { method: 'POST' })
  const body = await response.json().catch(() => null)

  if (!response.ok) {
    throw new Error(body?.error ?? `Request failed with status ${response.status}`)
  }
  return body as Greeting
}
