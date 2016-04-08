Return-Path: <SRS0+M7eh=QD=vger.kernel.org=netdev-owner@vergenet.net>
From: Jeff Kirsher <jeffrey.t.kirsher@intel.com>
To: davem@davemloft.net
Cc: Mark Rustad <mark.d.rustad@intel.com>, netdev@vger.kernel.org,
	nhorman@redhat.com, sassmann@redhat.com, jogreene@redhat.com,
	Jeff Kirsher <jeffrey.t.kirsher@intel.com>
Subject: [net-next 15/18] ixgbe: Add support for SFPs with retimer
Date: Thu,  7 Apr 2016 20:21:10 -0700
Message-Id: <1460085673-87056-16-git-send-email-jeffrey.t.kirsher@intel.com>
In-Reply-To: <1460085673-87056-1-git-send-email-jeffrey.t.kirsher@intel.com>
References: <1460085673-87056-1-git-send-email-jeffrey.t.kirsher@intel.com>
Sender: netdev-owner@vger.kernel.org
Return-Path: <SRS0+m++y=QR=vger.kernel.org=linux-renesas-soc-owner@vergenet.net>
Received: from kirsty.vergenet.net ([202.4.237.240]:40677 "EHLO
	kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751508AbcDVAPC (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Thu, 21 Apr 2016 20:15:02 -0400
Date: Fri, 22 Apr 2016 10:14:58 +1000
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
	Phil Edworthy <phil.edworthy@renesas.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-pci <linux-pci@vger.kernel.org>,
	linux-renesas-soc@vger.kernel.org,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v3] PCI: rcar-pcie: Remove Gen2 designation from Kconfig
Message-ID: <20160422001455.GA25416@verge.net.au>
References: <1461210715-29304-1-git-send-email-horms+renesas@verge.net.au>
 <CAMuHMdXtVvNERECxbp1EtJ1SNOQG-j_xtV3NpsGqgyDLmc7cOg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdXtVvNERECxbp1EtJ1SNOQG-j_xtV3NpsGqgyDLmc7cOg@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>
Return-Path: <SRS0+j/9D=QN=vger.kernel.org=netdev-owner@vergenet.net>
From: Alexander Aring <aar@pengutronix.de>
To: linux-wpan@vger.kernel.org
Cc: kernel@pengutronix.de, marcel@holtmann.org,
	jukka.rissanen@linux.intel.com, hannes@stressinduktion.org,
	stefan@osg.samsung.com, mcr@sandelman.ca, werner@almesberger.net,
	linux-bluetooth@vger.kernel.org, netdev@vger.kernel.org,
	Alexander Aring <aar@pengutronix.de>,
	"David S . Miller" <davem@davemloft.net>,
	Alexey Kuznetsov <kuznet@ms2.inr.ac.ru>,
	James Morris <jmorris@namei.org>,
	Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>,
	Patrick McHardy <kaber@trash.net>
Subject: [PATCH bluetooth-next 07/10] ipv6: introduce neighbour discovery ops
Date: Mon, 18 Apr 2016 12:58:25 +0200
Message-Id: <1460977108-4675-8-git-send-email-aar@pengutronix.de>
In-Reply-To: <1460977108-4675-1-git-send-email-aar@pengutronix.de>
References: <1460977108-4675-1-git-send-email-aar@pengutronix.de>
Sender: netdev-owner@vger.kernel.org
Return-Path: <horms@penelope.isobedori.kobe.vergenet.net>
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	Magnus Damm <magnus.damm@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 3/5] ARM: dts: r8a7790: Don't disable referenced optional clocks
Date: Thu, 28 Apr 2016 09:08:10 +1000
Message-Id: <03adc1811cefae9494deb2002c7ab44f31d782d7.1461798352.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1461798352.git.horms+renesas@verge.net.au>
References: <cover.1461798352.git.horms+renesas@verge.net.au>

From: Mark Rustad <mark.d.rustad@intel.com>

Add support for SFPs with an external retimer.

Signed-off-by: Mark Rustad <mark.d.rustad@intel.com>
Tested-by: Andrew Bowers <andrewx.bowers@intel.com>
Signed-off-by: Jeff Kirsher <jeffrey.t.kirsher@intel.com>
---
 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c |   2 +
 drivers/net/ethernet/intel/ixgbe/ixgbe_phy.h  |   6 +-
 drivers/net/ethernet/intel/ixgbe/ixgbe_type.h |   5 +
 drivers/net/ethernet/intel/ixgbe/ixgbe_x550.c | 133 +++++++++++++++++++++++++-
 4 files changed, 144 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/intel/ixgbe/ixgbe_main.c b/drivers/net/ethernet/intel/ixgbe/ixgbe_main.c
index eb93319..93db4bf 100644
--- a/drivers/net/ethernet/intel/ixgbe/ixgbe_main.c
+++ b/drivers/net/ethernet/intel/ixgbe/ixgbe_main.c
@@ -132,6 +132,7 @@ static const struct pci_device_id ixgbe_pci_tbl[] = {
 	{PCI_VDEVICE(INTEL, IXGBE_DEV_ID_X550EM_X_10G_T), board_X550EM_x},
 	{PCI_VDEVICE(INTEL, IXGBE_DEV_ID_X550EM_X_SFP), board_X550EM_x},
 	{PCI_VDEVICE(INTEL, IXGBE_DEV_ID_X550EM_A_SFP_N), board_x550em_a },
+	{PCI_VDEVICE(INTEL, IXGBE_DEV_ID_X550EM_A_SFP), board_x550em_a },
 	/* required last entry */
 	{0, }
 };
@@ -2681,6 +2682,7 @@ static inline void ixgbe_irq_enable(struct ixgbe_adapter *adapter, bool queues,
 	case ixgbe_mac_X550EM_x:
 	case ixgbe_mac_x550em_a:
 		if (adapter->hw.device_id == IXGBE_DEV_ID_X550EM_X_SFP ||
+		    adapter->hw.device_id == IXGBE_DEV_ID_X550EM_A_SFP ||
 		    adapter->hw.device_id == IXGBE_DEV_ID_X550EM_A_SFP_N)
 			mask |= IXGBE_EIMS_GPI_SDP0(&adapter->hw);
 		if (adapter->hw.phy.type == ixgbe_phy_x550em_ext_t)
diff --git a/drivers/net/ethernet/intel/ixgbe/ixgbe_phy.h b/drivers/net/ethernet/intel/ixgbe/ixgbe_phy.h
index 5abd66c..cdf4c38 100644
--- a/drivers/net/ethernet/intel/ixgbe/ixgbe_phy.h
+++ b/drivers/net/ethernet/intel/ixgbe/ixgbe_phy.h
@@ -1,7 +1,7 @@
 /*******************************************************************************
 
   Intel 10 Gigabit PCI Express Linux driver
-  Copyright(c) 1999 - 2014 Intel Corporation.
+  Copyright(c) 1999 - 2016 Intel Corporation.
 
   This program is free software; you can redistribute it and/or modify it
   under the terms and conditions of the GNU General Public License,
@@ -81,7 +81,11 @@
 #define IXGBE_I2C_EEPROM_STATUS_FAIL		0x2
 #define IXGBE_I2C_EEPROM_STATUS_IN_PROGRESS	0x3
 #define IXGBE_CS4227				0xBE    /* CS4227 address */
+#define IXGBE_CS4227_GLOBAL_ID_LSB		0
+#define IXGBE_CS4227_GLOBAL_ID_MSB		1
 #define IXGBE_CS4227_SCRATCH			2
+#define IXGBE_CS4223_PHY_ID			0x7003	/* Quad port */
+#define IXGBE_CS4227_PHY_ID			0x3003	/* Dual port */
 #define IXGBE_CS4227_RESET_PENDING		0x1357
 #define IXGBE_CS4227_RESET_COMPLETE		0x5AA5
 #define IXGBE_CS4227_RETRIES			15
diff --git a/drivers/net/ethernet/intel/ixgbe/ixgbe_type.h b/drivers/net/ethernet/intel/ixgbe/ixgbe_type.h
index 6b68e8b..fbbc132 100644
--- a/drivers/net/ethernet/intel/ixgbe/ixgbe_type.h
+++ b/drivers/net/ethernet/intel/ixgbe/ixgbe_type.h
@@ -1311,6 +1311,7 @@ struct ixgbe_thermal_sensor_data {
 
 /* MDIO definitions */
 
+#define IXGBE_MDIO_ZERO_DEV_TYPE		0x0
 #define IXGBE_MDIO_PMA_PMD_DEV_TYPE		0x1
 #define IXGBE_MDIO_PCS_DEV_TYPE		0x3
 #define IXGBE_MDIO_PHY_XS_DEV_TYPE		0x4
@@ -3580,6 +3581,7 @@ struct ixgbe_info {
 #define IXGBE_KRM_PORT_CAR_GEN_CTRL(P)	((P) ? 0x8010 : 0x4010)
 #define IXGBE_KRM_LINK_CTRL_1(P)	((P) ? 0x820C : 0x420C)
 #define IXGBE_KRM_AN_CNTL_1(P)		((P) ? 0x822C : 0x422C)
+#define IXGBE_KRM_AN_CNTL_8(P)		((P) ? 0x8248 : 0x4248)
 #define IXGBE_KRM_DSP_TXFFE_STATE_4(P)	((P) ? 0x8634 : 0x4634)
 #define IXGBE_KRM_DSP_TXFFE_STATE_5(P)	((P) ? 0x8638 : 0x4638)
 #define IXGBE_KRM_RX_TRN_LINKUP_CTRL(P)	((P) ? 0x8B00 : 0x4B00)
@@ -3605,6 +3607,9 @@ struct ixgbe_info {
 #define IXGBE_KRM_AN_CNTL_1_SYM_PAUSE			(1 << 28)
 #define IXGBE_KRM_AN_CNTL_1_ASM_PAUSE			(1 << 29)
 
+#define IXGBE_KRM_AN_CNTL_8_LINEAR			BIT(0)
+#define IXGBE_KRM_AN_CNTL_8_LIMITING			BIT(1)
+
 #define IXGBE_KRM_DSP_TXFFE_STATE_C0_EN			(1 << 6)
 #define IXGBE_KRM_DSP_TXFFE_STATE_CP1_CN1_EN		(1 << 15)
 #define IXGBE_KRM_DSP_TXFFE_STATE_CO_ADAPT_EN		(1 << 16)
diff --git a/drivers/net/ethernet/intel/ixgbe/ixgbe_x550.c b/drivers/net/ethernet/intel/ixgbe/ixgbe_x550.c
index 0d6cbb0..a9d86b3 100644
--- a/drivers/net/ethernet/intel/ixgbe/ixgbe_x550.c
+++ b/drivers/net/ethernet/intel/ixgbe/ixgbe_x550.c
@@ -273,6 +273,12 @@ out:
 static s32 ixgbe_identify_phy_x550em(struct ixgbe_hw *hw)
 {
 	switch (hw->device_id) {
+	case IXGBE_DEV_ID_X550EM_A_SFP:
+		if (hw->bus.lan_id)
+			hw->phy.phy_semaphore_mask = IXGBE_GSSR_PHY1_SM;
+		else
+			hw->phy.phy_semaphore_mask = IXGBE_GSSR_PHY0_SM;
+		return ixgbe_identify_module_generic(hw);
 	case IXGBE_DEV_ID_X550EM_X_SFP:
 		/* set up for CS4227 usage */
 		hw->phy.phy_semaphore_mask = IXGBE_GSSR_SHARED_I2C_SM;
@@ -1363,6 +1369,117 @@ i2c_err:
 }
 
 /**
+ * ixgbe_setup_mac_link_sfp_n - Setup internal PHY for native SFP
+ * @hw: pointer to hardware structure
+ *
+ * Configure the the integrated PHY for native SFP support.
+ */
+static s32
+ixgbe_setup_mac_link_sfp_n(struct ixgbe_hw *hw, ixgbe_link_speed speed,
+			   __always_unused bool autoneg_wait_to_complete)
+{
+	bool setup_linear = false;
+	u32 reg_phy_int;
+	s32 rc;
+
+	/* Check if SFP module is supported and linear */
+	rc = ixgbe_supported_sfp_modules_X550em(hw, &setup_linear);
+
+	/* If no SFP module present, then return success. Return success since
+	 * SFP not present error is not excepted in the setup MAC link flow.
+	 */
+	if (rc == IXGBE_ERR_SFP_NOT_PRESENT)
+		return 0;
+
+	if (!rc)
+		return rc;
+
+	/* Configure internal PHY for native SFI */
+	rc = hw->mac.ops.read_iosf_sb_reg(hw,
+					  IXGBE_KRM_AN_CNTL_8(hw->bus.lan_id),
+					  IXGBE_SB_IOSF_TARGET_KR_PHY,
+					  &reg_phy_int);
+	if (rc)
+		return rc;
+
+	if (setup_linear) {
+		reg_phy_int &= ~IXGBE_KRM_AN_CNTL_8_LIMITING;
+		reg_phy_int |= IXGBE_KRM_AN_CNTL_8_LINEAR;
+	} else {
+		reg_phy_int |= IXGBE_KRM_AN_CNTL_8_LIMITING;
+		reg_phy_int &= ~IXGBE_KRM_AN_CNTL_8_LINEAR;
+	}
+
+	rc = hw->mac.ops.write_iosf_sb_reg(hw,
+					   IXGBE_KRM_AN_CNTL_8(hw->bus.lan_id),
+					   IXGBE_SB_IOSF_TARGET_KR_PHY,
+					   reg_phy_int);
+	if (rc)
+		return rc;
+
+	/* Setup XFI/SFI internal link */
+	return ixgbe_setup_ixfi_x550em(hw, &speed);
+}
+
+/**
+ * ixgbe_setup_mac_link_sfp_x550a - Setup internal PHY for SFP
+ * @hw: pointer to hardware structure
+ *
+ * Configure the the integrated PHY for SFP support.
+ */
+static s32
+ixgbe_setup_mac_link_sfp_x550a(struct ixgbe_hw *hw, ixgbe_link_speed speed,
+			       __always_unused bool autoneg_wait_to_complete)
+{
+	u32 reg_slice, slice_offset;
+	bool setup_linear = false;
+	u16 reg_phy_ext;
+	s32 rc;
+
+	/* Check if SFP module is supported and linear */
+	rc = ixgbe_supported_sfp_modules_X550em(hw, &setup_linear);
+
+	/* If no SFP module present, then return success. Return success since
+	 * SFP not present error is not excepted in the setup MAC link flow.
+	 */
+	if (rc == IXGBE_ERR_SFP_NOT_PRESENT)
+		return 0;
+
+	if (!rc)
+		return rc;
+
+	/* Configure internal PHY for KR/KX. */
+	ixgbe_setup_kr_speed_x550em(hw, speed);
+
+	if (!hw->phy.mdio.prtad || hw->phy.mdio.prtad == 0xFFFF)
+		return IXGBE_ERR_PHY_ADDR_INVALID;
+
+	/* Get external PHY device id */
+	rc = hw->phy.ops.read_reg(hw, IXGBE_CS4227_GLOBAL_ID_MSB,
+				  IXGBE_MDIO_ZERO_DEV_TYPE, &reg_phy_ext);
+	if (rc)
+		return rc;
+
+	/* When configuring quad port CS4223, the MAC instance is part
+	 * of the slice offset.
+	 */
+	if (reg_phy_ext == IXGBE_CS4223_PHY_ID)
+		slice_offset = (hw->bus.lan_id +
+				(hw->bus.instance_id << 1)) << 12;
+	else
+		slice_offset = hw->bus.lan_id << 12;
+
+	/* Configure CS4227/CS4223 LINE side to proper mode. */
+	reg_slice = IXGBE_CS4227_LINE_SPARE24_LSB + slice_offset;
+	if (setup_linear)
+		reg_phy_ext = (IXGBE_CS4227_EDC_MODE_CX1 << 1) | 1;
+	else
+		reg_phy_ext = (IXGBE_CS4227_EDC_MODE_SR << 1) | 1;
+	return hw->phy.ops.write_reg(hw, reg_slice, IXGBE_MDIO_ZERO_DEV_TYPE,
+				     reg_phy_ext);
+}
+
+/**
  * ixgbe_setup_mac_link_t_X550em - Sets the auto advertised link speed
  * @hw: pointer to hardware structure
  * @speed: new link speed
@@ -1456,9 +1573,21 @@ static void ixgbe_init_mac_link_ops_X550em(struct ixgbe_hw *hw)
 		mac->ops.disable_tx_laser = NULL;
 		mac->ops.enable_tx_laser = NULL;
 		mac->ops.flap_tx_laser = NULL;
-		mac->ops.setup_mac_link = ixgbe_setup_mac_link_sfp_x550em;
 		mac->ops.setup_link = ixgbe_setup_mac_link_multispeed_fiber;
 		mac->ops.setup_fc = ixgbe_setup_fc_x550em;
+		switch (hw->device_id) {
+		case IXGBE_DEV_ID_X550EM_A_SFP_N:
+			mac->ops.setup_mac_link = ixgbe_setup_mac_link_sfp_n;
+			break;
+		case IXGBE_DEV_ID_X550EM_A_SFP:
+			mac->ops.setup_mac_link =
+						ixgbe_setup_mac_link_sfp_x550a;
+			break;
+		default:
+			mac->ops.setup_mac_link =
+						ixgbe_setup_mac_link_sfp_x550em;
+			break;
+		}
 		mac->ops.set_rate_select_speed =
 					ixgbe_set_soft_rate_select_speed;
 		break;
@@ -2253,6 +2382,7 @@ static enum ixgbe_media_type ixgbe_get_media_type_X550em(struct ixgbe_hw *hw)
 		media_type = ixgbe_media_type_backplane;
 		break;
 	case IXGBE_DEV_ID_X550EM_X_SFP:
+	case IXGBE_DEV_ID_X550EM_A_SFP:
 	case IXGBE_DEV_ID_X550EM_A_SFP_N:
 		media_type = ixgbe_media_type_fiber;
 		break;
@@ -2316,6 +2446,7 @@ static void ixgbe_set_mdio_speed(struct ixgbe_hw *hw)
 
 	switch (hw->device_id) {
 	case IXGBE_DEV_ID_X550EM_X_10G_T:
+	case IXGBE_DEV_ID_X550EM_A_SFP:
 		/* Config MDIO clock speed before the first MDIO PHY access */
 		hlreg0 = IXGBE_READ_REG(hw, IXGBE_HLREG0);
 		hlreg0 &= ~IXGBE_HLREG0_MDCSPD;
-- 
2.5.5

On Thu, Apr 21, 2016 at 03:38:35PM +0200, Geert Uytterhoeven wrote:
> On Thu, Apr 21, 2016 at 5:51 AM, Simon Horman
> <horms+renesas@verge.net.au> wrote:
> > It appears that Gen2 is a misnomer for the R-Car PCIE driver
> > which also supports Gen 1 and Gen 3 SoCs. Accordingly, drop Gen 2
> > from the help text and Kconfig symbol.
> >
> > Also, re-arange the Kconfig symbol name to use PCIE as the prefix.
> > This appears to be in keeping with other PCIE Kconfig symbols.
> >
> > Reported-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> > Acked-by: Bjorn Helgaas <bhelgaas@google.com>
> 
> Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks, I have queued this up.

This patch introduces neighbour discovery ops callback structure. The
structure contains at first receive and transmit handling for NS/NA and
userspace option field functionality.

These callback offers 6lowpan different handling, such as 802.15.4 short
address handling or RFC6775 (Neighbor Discovery Optimization for IPv6 over
6LoWPANs).

Cc: David S. Miller <davem@davemloft.net>
Cc: Alexey Kuznetsov <kuznet@ms2.inr.ac.ru>
Cc: James Morris <jmorris@namei.org>
Cc: Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>
Cc: Patrick McHardy <kaber@trash.net>
Signed-off-by: Alexander Aring <aar@pengutronix.de>
---
 include/linux/netdevice.h |  3 ++
 include/net/ndisc.h       | 73 ++++++++++++++++++++++++++++++++++++++++++-----
 net/ipv6/addrconf.c       |  1 +
 net/ipv6/ndisc.c          | 71 +++++++++++++++++++++++++++++++--------------
 net/ipv6/route.c          |  2 +-
 5 files changed, 121 insertions(+), 29 deletions(-)

diff --git a/include/linux/netdevice.h b/include/linux/netdevice.h
index 0052c42..4f1b3f2 100644
--- a/include/linux/netdevice.h
+++ b/include/linux/netdevice.h
@@ -1677,6 +1677,9 @@ struct net_device {
 #ifdef CONFIG_NET_L3_MASTER_DEV
 	const struct l3mdev_ops	*l3mdev_ops;
 #endif
+#ifdef CONFIG_IPV6
+	const struct ndisc_ops *ndisc_ops;
+#endif
 
 	const struct header_ops *header_ops;
 
diff --git a/include/net/ndisc.h b/include/net/ndisc.h
index aac868e..5346625 100644
--- a/include/net/ndisc.h
+++ b/include/net/ndisc.h
@@ -110,7 +110,8 @@ struct ndisc_options {
 
 #define NDISC_OPT_SPACE(len) (((len)+2+7)&~7)
 
-struct ndisc_options *ndisc_parse_options(u8 *opt, int opt_len,
+struct ndisc_options *ndisc_parse_options(const struct net_device *dev,
+					  u8 *opt, int opt_len,
 					  struct ndisc_options *ndopts);
 
 /*
@@ -173,6 +174,70 @@ static inline struct neighbour *__ipv6_neigh_lookup(struct net_device *dev, cons
 	return n;
 }
 
+static inline int __ip6_ndisc_is_useropt(struct nd_opt_hdr *opt)
+{
+	return opt->nd_opt_type == ND_OPT_RDNSS ||
+		opt->nd_opt_type == ND_OPT_DNSSL;
+}
+
+struct ndisc_ops {
+	int	(*is_useropt)(struct nd_opt_hdr *opt);
+	void	(*send_na)(struct net_device *dev,
+			   const struct in6_addr *daddr,
+			   const struct in6_addr *solicited_addr,
+			   bool router, bool solicited,
+			   bool override, bool inc_opt);
+	void	(*recv_na)(struct sk_buff *skb);
+	void	(*send_ns)(struct net_device *dev,
+			   const struct in6_addr *solicit,
+			   const struct in6_addr *daddr,
+			   const struct in6_addr *saddr);
+	void	(*recv_ns)(struct sk_buff *skb);
+};
+
+static inline int ndisc_is_useropt(const struct net_device *dev,
+				   struct nd_opt_hdr *opt)
+{
+	if (likely(dev->ndisc_ops->is_useropt))
+		return dev->ndisc_ops->is_useropt(opt);
+	else
+		return 0;
+}
+
+static inline void ndisc_send_na(struct net_device *dev,
+				 const struct in6_addr *daddr,
+				 const struct in6_addr *solicited_addr,
+				 bool router, bool solicited, bool override,
+				 bool inc_opt)
+{
+	if (likely(dev->ndisc_ops->send_na))
+		dev->ndisc_ops->send_na(dev, daddr, solicited_addr, router,
+					solicited, override, inc_opt);
+}
+
+static inline void ndisc_recv_na(struct sk_buff *skb)
+{
+	if (likely(skb->dev->ndisc_ops->recv_na))
+		skb->dev->ndisc_ops->recv_na(skb);
+}
+
+static inline void ndisc_send_ns(struct net_device *dev,
+				 const struct in6_addr *solicit,
+				 const struct in6_addr *daddr,
+				 const struct in6_addr *saddr)
+{
+	if (likely(dev->ndisc_ops->send_ns))
+		dev->ndisc_ops->send_ns(dev, solicit, daddr, saddr);
+}
+
+static inline void ndisc_recv_ns(struct sk_buff *skb)
+{
+	if (likely(skb->dev->ndisc_ops->recv_ns))
+		skb->dev->ndisc_ops->recv_ns(skb);
+}
+
+void ip6_register_ndisc_ops(struct net_device *dev);
+
 int ndisc_init(void);
 int ndisc_late_init(void);
 
@@ -181,14 +246,8 @@ void ndisc_cleanup(void);
 
 int ndisc_rcv(struct sk_buff *skb);
 
-void ndisc_send_ns(struct net_device *dev, const struct in6_addr *solicit,
-		   const struct in6_addr *daddr, const struct in6_addr *saddr);
-
 void ndisc_send_rs(struct net_device *dev,
 		   const struct in6_addr *saddr, const struct in6_addr *daddr);
-void ndisc_send_na(struct net_device *dev, const struct in6_addr *daddr,
-		   const struct in6_addr *solicited_addr,
-		   bool router, bool solicited, bool override, bool inc_opt);
 
 void ndisc_send_redirect(struct sk_buff *skb, const struct in6_addr *target);
 
diff --git a/net/ipv6/addrconf.c b/net/ipv6/addrconf.c
index 54e18c2..a2ef04b 100644
--- a/net/ipv6/addrconf.c
+++ b/net/ipv6/addrconf.c
@@ -3266,6 +3266,7 @@ static int addrconf_notify(struct notifier_block *this, unsigned long event,
 			idev = ipv6_add_dev(dev);
 			if (IS_ERR(idev))
 				return notifier_from_errno(PTR_ERR(idev));
+			ip6_register_ndisc_ops(dev);
 		}
 		break;
 
diff --git a/net/ipv6/ndisc.c b/net/ipv6/ndisc.c
index 176c7c4..297080a 100644
--- a/net/ipv6/ndisc.c
+++ b/net/ipv6/ndisc.c
@@ -185,24 +185,25 @@ static struct nd_opt_hdr *ndisc_next_option(struct nd_opt_hdr *cur,
 	return cur <= end && cur->nd_opt_type == type ? cur : NULL;
 }
 
-static inline int ndisc_is_useropt(struct nd_opt_hdr *opt)
+static inline int ip6_ndisc_is_useropt(struct nd_opt_hdr *opt)
 {
-	return opt->nd_opt_type == ND_OPT_RDNSS ||
-		opt->nd_opt_type == ND_OPT_DNSSL;
+	return __ip6_ndisc_is_useropt(opt);
 }
 
-static struct nd_opt_hdr *ndisc_next_useropt(struct nd_opt_hdr *cur,
+static struct nd_opt_hdr *ndisc_next_useropt(const struct net_device *dev,
+					     struct nd_opt_hdr *cur,
 					     struct nd_opt_hdr *end)
 {
 	if (!cur || !end || cur >= end)
 		return NULL;
 	do {
 		cur = ((void *)cur) + (cur->nd_opt_len << 3);
-	} while (cur < end && !ndisc_is_useropt(cur));
-	return cur <= end && ndisc_is_useropt(cur) ? cur : NULL;
+	} while (cur < end && !ndisc_is_useropt(dev, cur));
+	return cur <= end && ndisc_is_useropt(dev, cur) ? cur : NULL;
 }
 
-struct ndisc_options *ndisc_parse_options(u8 *opt, int opt_len,
+struct ndisc_options *ndisc_parse_options(const struct net_device *dev,
+					  u8 *opt, int opt_len,
 					  struct ndisc_options *ndopts)
 {
 	struct nd_opt_hdr *nd_opt = (struct nd_opt_hdr *)opt;
@@ -243,7 +244,7 @@ struct ndisc_options *ndisc_parse_options(u8 *opt, int opt_len,
 			break;
 #endif
 		default:
-			if (ndisc_is_useropt(nd_opt)) {
+			if (ndisc_is_useropt(dev, nd_opt)) {
 				ndopts->nd_useropts_end = nd_opt;
 				if (!ndopts->nd_useropts)
 					ndopts->nd_useropts = nd_opt;
@@ -479,9 +480,11 @@ static void ndisc_send_skb(struct sk_buff *skb,
 	rcu_read_unlock();
 }
 
-void ndisc_send_na(struct net_device *dev, const struct in6_addr *daddr,
-		   const struct in6_addr *solicited_addr,
-		   bool router, bool solicited, bool override, bool inc_opt)
+static void ip6_ndisc_send_na(struct net_device *dev,
+			      const struct in6_addr *daddr,
+			      const struct in6_addr *solicited_addr,
+			      bool router, bool solicited, bool override,
+			      bool inc_opt)
 {
 	struct sk_buff *skb;
 	struct in6_addr tmpaddr;
@@ -555,8 +558,10 @@ static void ndisc_send_unsol_na(struct net_device *dev)
 	in6_dev_put(idev);
 }
 
-void ndisc_send_ns(struct net_device *dev, const struct in6_addr *solicit,
-		   const struct in6_addr *daddr, const struct in6_addr *saddr)
+static void ip6_ndisc_send_ns(struct net_device *dev,
+			      const struct in6_addr *solicit,
+			      const struct in6_addr *daddr,
+			      const struct in6_addr *saddr)
 {
 	struct sk_buff *skb;
 	struct in6_addr addr_buf;
@@ -702,7 +707,7 @@ static int pndisc_is_router(const void *pkey,
 	return ret;
 }
 
-static void ndisc_recv_ns(struct sk_buff *skb)
+static void ip6_ndisc_recv_ns(struct sk_buff *skb)
 {
 	struct nd_msg *msg = (struct nd_msg *)skb_transport_header(skb);
 	const struct in6_addr *saddr = &ipv6_hdr(skb)->saddr;
@@ -738,7 +743,7 @@ static void ndisc_recv_ns(struct sk_buff *skb)
 		return;
 	}
 
-	if (!ndisc_parse_options(msg->opt, ndoptlen, &ndopts)) {
+	if (!ndisc_parse_options(dev, msg->opt, ndoptlen, &ndopts)) {
 		ND_PRINTK(2, warn, "NS: invalid ND options\n");
 		return;
 	}
@@ -874,7 +879,7 @@ out:
 		in6_dev_put(idev);
 }
 
-static void ndisc_recv_na(struct sk_buff *skb)
+static void ip6_ndisc_recv_na(struct sk_buff *skb)
 {
 	struct nd_msg *msg = (struct nd_msg *)skb_transport_header(skb);
 	struct in6_addr *saddr = &ipv6_hdr(skb)->saddr;
@@ -912,7 +917,7 @@ static void ndisc_recv_na(struct sk_buff *skb)
 	    idev->cnf.drop_unsolicited_na)
 		return;
 
-	if (!ndisc_parse_options(msg->opt, ndoptlen, &ndopts)) {
+	if (!ndisc_parse_options(dev, msg->opt, ndoptlen, &ndopts)) {
 		ND_PRINTK(2, warn, "NS: invalid ND option\n");
 		return;
 	}
@@ -1019,7 +1024,7 @@ static void ndisc_recv_rs(struct sk_buff *skb)
 		goto out;
 
 	/* Parse ND options */
-	if (!ndisc_parse_options(rs_msg->opt, ndoptlen, &ndopts)) {
+	if (!ndisc_parse_options(skb->dev, rs_msg->opt, ndoptlen, &ndopts)) {
 		ND_PRINTK(2, notice, "NS: invalid ND option, ignored\n");
 		goto out;
 	}
@@ -1137,7 +1142,7 @@ static void ndisc_router_discovery(struct sk_buff *skb)
 		return;
 	}
 
-	if (!ndisc_parse_options(opt, optlen, &ndopts)) {
+	if (!ndisc_parse_options(skb->dev, opt, optlen, &ndopts)) {
 		ND_PRINTK(2, warn, "RA: invalid ND options\n");
 		return;
 	}
@@ -1424,7 +1429,8 @@ skip_routeinfo:
 		struct nd_opt_hdr *p;
 		for (p = ndopts.nd_useropts;
 		     p;
-		     p = ndisc_next_useropt(p, ndopts.nd_useropts_end)) {
+		     p = ndisc_next_useropt(skb->dev, p,
+					    ndopts.nd_useropts_end)) {
 			ndisc_ra_useropt(skb, p);
 		}
 	}
@@ -1462,7 +1468,7 @@ static void ndisc_redirect_rcv(struct sk_buff *skb)
 		return;
 	}
 
-	if (!ndisc_parse_options(msg->opt, ndoptlen, &ndopts))
+	if (!ndisc_parse_options(skb->dev, msg->opt, ndoptlen, &ndopts))
 		return;
 
 	if (!ndopts.nd_opts_rh) {
@@ -1783,6 +1789,29 @@ int ndisc_ifinfo_sysctl_change(struct ctl_table *ctl, int write, void __user *bu
 
 #endif
 
+static const struct ndisc_ops ip6_ndisc_ops = {
+	.is_useropt = ip6_ndisc_is_useropt,
+	.send_na = ip6_ndisc_send_na,
+	.recv_na = ip6_ndisc_recv_na,
+	.send_ns = ip6_ndisc_send_ns,
+	.recv_ns = ip6_ndisc_recv_ns,
+};
+
+void ip6_register_ndisc_ops(struct net_device *dev)
+{
+	switch (dev->type) {
+	default:
+		if (dev->ndisc_ops) {
+			ND_PRINTK(2, warn,
+				  "%s: ndisc_ops already defined for interface type=%d\n",
+				  __func__, dev->type);
+		} else {
+			dev->ndisc_ops = &ip6_ndisc_ops;
+		}
+		break;
+	}
+}
+
 static int __net_init ndisc_net_init(struct net *net)
 {
 	struct ipv6_pinfo *np;
diff --git a/net/ipv6/route.c b/net/ipv6/route.c
index cc180b3..5fa276d 100644
--- a/net/ipv6/route.c
+++ b/net/ipv6/route.c
@@ -2149,7 +2149,7 @@ static void rt6_do_redirect(struct dst_entry *dst, struct sock *sk, struct sk_bu
 	 *	first-hop router for the specified ICMP Destination Address.
 	 */
 
-	if (!ndisc_parse_options(msg->opt, optlen, &ndopts)) {
+	if (!ndisc_parse_options(skb->dev, msg->opt, optlen, &ndopts)) {
 		net_dbg_ratelimited("rt6_redirect: invalid ND options\n");
 		return;
 	}
-- 
2.8.0

From: Geert Uytterhoeven <geert+renesas@glider.be>

clk_get() on a disabled clock node will return -EPROBE_DEFER, which can
cause drivers to be deferred forever if such clocks are referenced in
their devices' clocks properties.

Update the various disabled external clock nodes to default to a
frequency of 0, but don't disable them, to prevent this.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm/boot/dts/r8a7790.dtsi | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/r8a7790.dtsi b/arch/arm/boot/dts/r8a7790.dtsi
index 776a2aed81d2..935064fe7b13 100644
--- a/arch/arm/boot/dts/r8a7790.dtsi
+++ b/arch/arm/boot/dts/r8a7790.dtsi
@@ -1032,8 +1032,7 @@
 		pcie_bus_clk: pcie_bus {
 			compatible = "fixed-clock";
 			#clock-cells = <0>;
-			clock-frequency = <100000000>;
-			status = "disabled";
+			clock-frequency = <0>;
 		};
 
 		/*
@@ -1062,7 +1061,6 @@
 			#clock-cells = <0>;
 			/* This value must be overridden by the board. */
 			clock-frequency = <0>;
-			status = "disabled";
 		};
 
 		/* External USB clock - can be overridden by the board */
@@ -1078,7 +1076,6 @@
 			#clock-cells = <0>;
 			/* This value must be overridden by the board. */
 			clock-frequency = <0>;
-			status = "disabled";
 		};
 
 		/* Special CPG clocks */
-- 
2.7.0.rc3.207.g0ac5344
