try:
    import torch
    import torch.nn as nn
except ImportError:
    import os
    os.system("pip3 install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cu118")
    import torch
    import torch.nn as nn

__all__ = ['RecommendationMLP']


class RecommendationMLP(nn.Module):
    def __init__(self, input_dim, hidden_size1, hidden_size2, output_dim):
        super(RecommendationMLP, self).__init__()

        self.dropout1 = nn.Dropout(0.2)
        self.dropout2 = nn.Dropout(0.3)
        self.fc1 = nn.Linear(input_dim, hidden_size1)
        self.fc2 = nn.Linear(hidden_size1, hidden_size2)
        self.fc3 = nn.Linear(hidden_size2, hidden_size2)
        self.fc4 = nn.Linear(hidden_size2, output_dim)

    def forward(self, x):
        x = torch.nn.functional.elu(self.fc1(x), alpha=1)
        x = self.dropout1(x)
        x = torch.nn.functional.elu(self.fc2(x), alpha=1)
        x = self.dropout2(x)
        x = torch.nn.functional.elu(self.fc3(x), alpha=1)
        x = self.fc4(x)
        return x
