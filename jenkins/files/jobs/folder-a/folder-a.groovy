folder('folder-a') {
    description('Folder containing all jobs for the project folder A')
    authorization {
        permissions('user1', [
            'hudson.model.Item.Create',
            'hudson.model.Item.Discover'
        ])
    }
}
