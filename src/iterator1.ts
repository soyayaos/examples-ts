const fibonacci = (to: number) => {
    if (to < 0) {
        throw new Error('Unsupported value')
    }
    to += 2
    return {
        [Symbol.iterator]: () => {
            let step = 1
            let prev = 0
            let current = 0
            return {
                next: () => {
                    step ++
                    [prev, current] = [current, (prev + current) || 1]
                    if (step !== to) {
                        return {
                            value: {
                                step: step - 1,
                                value: prev,
                            },
                            done: false
                        }
                    }
                    return {
                        done: true
                    }
                }
            }
        }
    }
}

for (const v of fibonacci(20)) {
    console.log(v)
}
