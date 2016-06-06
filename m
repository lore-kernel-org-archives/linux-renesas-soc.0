Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
Subject: [PATCH v1 06/25] PCI: xgene: Free bridge resource list on failure
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
Date: Mon, 06 Jun 2016 18:05:30 -0500
Message-ID: <20160606230530.20936.50110.stgit@bhelgaas-glaptop2.roam.corp.google.com>
In-Reply-To: <20160606225630.20936.77349.stgit@bhelgaas-glaptop2.roam.corp.google.com>
References: <20160606225630.20936.77349.stgit@bhelgaas-glaptop2.roam.corp.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

of_pci_get_host_bridge_resources() allocates a list of resources for host
bridge windows.  If we fail after allocating that list, free it before we
return error.

Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
---
 drivers/pci/host/pci-xgene.c |   12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/pci/host/pci-xgene.c b/drivers/pci/host/pci-xgene.c
index ae00ce2..bc4e1c6 100644
--- a/drivers/pci/host/pci-xgene.c
+++ b/drivers/pci/host/pci-xgene.c
@@ -542,12 +542,14 @@ static int xgene_pcie_probe_bridge(struct platform_device *pdev)
 
 	ret = xgene_pcie_setup(port, &res, iobase);
 	if (ret)
-		return ret;
+		goto error;
 
 	bus = pci_create_root_bus(&pdev->dev, 0,
 					&xgene_pcie_ops, port, &res);
-	if (!bus)
-		return -ENOMEM;
+	if (!bus) {
+		ret = -ENOMEM;
+		goto error;
+	}
 
 	pci_scan_child_bus(bus);
 	pci_assign_unassigned_bus_resources(bus);
@@ -555,6 +557,10 @@ static int xgene_pcie_probe_bridge(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, port);
 	return 0;
+
+error:
+	pci_free_resource_list(&res);
+	return ret;
 }
 
 static const struct of_device_id xgene_pcie_match_table[] = {
