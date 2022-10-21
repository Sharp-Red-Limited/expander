function test($filename) {
    try {
        $file = [System.IO.File]::Open($filename, 'Open', "Write")
        $file.Close()

        return true
    }
    catch {

        { return false }
    }
}
test("./wibble.txt")