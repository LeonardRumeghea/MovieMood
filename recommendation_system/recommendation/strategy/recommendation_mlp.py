try:
    import torch
    import torch.nn as nn
except ImportError:
    import os
    os.system("pip3 install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cu118")
    import torch
    import torch.nn as nn


class RecommendationMLP(nn.Module):
    def __init__(self, input_dim, hidden_size1, hidden_size2, output_dim):
        super(RecommendationMLP, self).__init__()

        self.fc1 = nn.Linear(input_dim, hidden_size1)
        self.fc2 = nn.Linear(hidden_size1, hidden_size2)
        self.fc3 = nn.Linear(hidden_size2, output_dim)

    def forward(self, x):
        x = torch.relu(self.fc1(x))
        x = torch.relu(self.fc2(x))
        x = self.fc3(x)
        return x