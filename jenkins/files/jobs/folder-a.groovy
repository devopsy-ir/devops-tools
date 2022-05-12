folder('folder-a') {
    description('Folder containing all jobs')
    authorization {
        permissions('user1', [
            'hudson.model.Item.Create', 
            'hudson.model.Item.Discover',
            'hudson.model.Item.Build',
            'hudson.model.Item.Cancel',
            'hudson.model.Item.Read',
            'hudson.model.Item.Workspace'
        ])
        permissions('user2', [
            'hudson.model.Item.Build',
            'hudson.model.Item.Cancel',
            'hudson.model.Item.Read',
            'hudson.model.Item.Workspace'
        ])
    }
}
