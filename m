Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
Subject: [PATCH v1 07/25] PCI: xgene: Request host bridge window resources
To: linux-pci@vger.kernel.org
From: Bjorn Helgaas <bhelgaas@google.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
	Rob Herring <robh@kernel.org>,
	Jason Cooper <jason@lakedaemon.net>,
	Scott Branden <sbranden@broadcom.com>,
	Jon Mason <jonmason@broadcom.com>,
	Jingoo Han <jingoohan1@gmail.com>,
	Pratyush Anand <pratyush.anand@gmail.com>,
	linux-kernel@vger.kernel.org, rfi@lists.rocketboards.org,
	linux-renesas-soc@vger.kernel.org,
	Simon Horman <horms@verge.net.au>,
	Thierry Reding <thierry.reding@gmail.com>,
	Tanmay Inamdar <tinamdar@apm.com>, Ray Jui <rjui@broadcom.com>,
	linux-tegra@vger.kernel.org, Ley Foon Tan <lftan@altera.com>,
	Michal Simek <michal.simek@xilinx.com>,
	=?utf-8?b?U8O2cmVu?= Brinkmann <soren.brinkmann@xilinx.com>,
	linux-arm-kernel@lists.infradead.org
Date: Mon, 06 Jun 2016 18:05:37 -0500
Message-ID: <20160606230537.20936.2892.stgit@bhelgaas-glaptop2.roam.corp.google.com>
In-Reply-To: <20160606225630.20936.77349.stgit@bhelgaas-glaptop2.roam.corp.google.com>
References: <20160606225630.20936.77349.stgit@bhelgaas-glaptop2.roam.corp.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Request host bridge window resources so they appear in ioport_resource and
iomem_resource and are reflected in /proc/ioports and /proc/iomem.

For example, the following entries did not previously appear in /proc/iomem:

  e180000000-e1ffffffff : /soc/pcie@1f2b0000
    e180000000-e182ffffff : PCI Bus 0000:01
      e180000000-e181ffffff : 0000:01:00.0
      e182000000-e1820fffff : 0000:01:00.0
      e182100000-e1821fffff : 0000:01:00.0
  f000000000-ffffffffff : /soc/pcie@1f2b0000

Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
---
 drivers/pci/host/pci-xgene.c |    4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/pci/host/pci-xgene.c b/drivers/pci/host/pci-xgene.c
index bc4e1c6..7eb20cc 100644
--- a/drivers/pci/host/pci-xgene.c
+++ b/drivers/pci/host/pci-xgene.c
@@ -540,6 +540,10 @@ static int xgene_pcie_probe_bridge(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	ret = devm_request_pci_bus_resources(&pdev->dev, &res);
+	if (ret)
+		goto error;
+
 	ret = xgene_pcie_setup(port, &res, iobase);
 	if (ret)
 		goto error;
