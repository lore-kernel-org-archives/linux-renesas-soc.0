Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04463476683
	for <linux-renesas-soc@vger.kernel.org>; Wed, 19 Aug 2026 14:36:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787150195; cv=none; b=JLw8zaKaVY3Pw2TTyfgZoW3uhk0adbaIIAl/zrgD8VNMy2uxKM9WpV84M2DlGRaEHQ3nsKKgeGHShBHudZcFmeIf9DL+Op/ZVbQVBV0wvdFDvoXKkWhJKvQ/H9lRxkhgbbr9rydl7OZbte73siIqgVO6UxExptBAKrmnnBNQSyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787150195; c=relaxed/simple;
	bh=Na4uaHXg57w9kAv3xaCw5y67sevFDq7qURCzWWK6fXE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jRbC7oHW9858fYFlk0RmxMUB2MaPeLDhbIih6OFqxLqQcQ010K0Co1GbQqAYtCinr3kCzZp4SvReZ9YK7YRAoEg5Fe/zwJbiDHAG7Q5igXXBOnCsOJLLYO3GCqonIFKwGoUhZMQ7g6cPS8ndat1PyfUQub5wwEX50bVMBwDwcaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=b+gIweF8; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="b+gIweF8"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-49954b88fffso11490595e9.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 19 Aug 2026 07:36:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1787150191; x=1787754991; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Kp4hRNkTNR4Hu4ACl9XI4FjBnuokSCETIUGoEEaQ0ic=;
        b=b+gIweF8d0UbrMb/VsdJ+sGNpBaFMw0sb/rxL58EeHVVM3NmydTj0oWre91MxonWnC
         ZYM/L7nO38mZOOS6CjCoeRq2dKh4WCmKj2glVTKIoID2ZPS0BJRXWtZK7BKOPPYQ9f8P
         ZYGI9cM/5Z6OWaX8CVcFhPoXIIrSJ8P8FNW5C7bCeewE1NGWFSh215Rgiel0khsADT7A
         NgrwmSkehtE202IZsoS+OF7V4rmkMKrM4Gsce3uHL5gvAmWmufdg4MUiCMJx6hJk50AK
         QO/1FGK4PK1PFQ40j3mizYpa/sAj1OTHlkCD28cvZf5GsFKiMrFkTPT63srP5sYyGDGJ
         14vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787150191; x=1787754991;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Kp4hRNkTNR4Hu4ACl9XI4FjBnuokSCETIUGoEEaQ0ic=;
        b=jDLeTuRSats3JGddMTazirVFT+lh5qizQ2JFEwUlR2AQSFLhTkYanowonI6s+oucCG
         GtDhqtR0JP2QdYj1WgVQyLIy12yqBZkNtwq+J3loyiYDlwkPM7zsiu5CtKRtPcfHnHal
         QXxXNJ//ReF1710v0FtmR9qLpUpauwzyb+0isqxn9SBjkugrEqxX551ghdIoebUNyd5e
         XPn+NuWBndXMYj3kNbz4+i2AqJBTkBYR3MUBD/Z0dE4sQ/hj7pxzRftBiL8+yXmu/Vpw
         CJVF2y76dw3hNJJz9ec4dd7b1Sw2d2wh00p63ClN4cuRp2E1urf3e08U2kRZnX7KQaIq
         41rw==
X-Forwarded-Encrypted: i=1; AHgh+RqWkdWaC4gvCUE3QccVfBofIvyFgm2dCfg1TOrdTSyMpr+aY5FOB99TpPJgrQYmNyz0rR5GjU8BuOUOxlG0d/CIJw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8vV/B0gwD7Pr/S0tetJKrORUDDYULHLKKdlhZZuJ68C+mUSrh
	I8UHTnA/chOO+JhU6oo2DfB1lpZt24rz1msNWXpQb+Ghghgf2CBHjzuXWJq36bafMNU=
X-Gm-Gg: AR+sD12+IR9SX+ZrtpsexNEl88KyAe/T6mhEcEBuK0ZqTlzGY92a4JuXLPCH4mL+vFy
	nFEAOqKBIKDVPolABVVhcFu4kUdnERs20MXNPSnqy7fKavHcT0ygizkxFqagJCXgwTfUaNh6yfH
	x9jwTZxy2bp1Xz7iDzsiG0ujMLkdHjGsFY+evJQUuxqv0ilxK+4mLUPBz/25/MpWCyjPTbtKP5j
	CAOLH9dh1BpM5bf9nqY5zlx45A8Y8C27pH/NbxEOC0BD7b57NbHoqOBao7AvcedGSWR5iOMO1ZA
	cphCuDcFZaGL5J3zdd6TaJUeZ2izvg3v+amsfbGxPWVqS8chXE4Sx4DsBHHn7HGG1FNGXFGDyM4
	QQNmcNfrj1cGTyioaNOUy1mn0EO9Qqfokl6h8FoQQnsieOXxYem7aQYfdK8xybBfcXgzAFIPMia
	/kga/8WQOYYMQLvYndtz90kQoRM2tXuW3FFlFRsUDl4cFo75a8fncdofCprr6TiMZW4PmzgV5Mo
	KBJ/fuzr5320kclm8v5tsC/AiGgdet/ouErGvbnIdpYWWDokQ==
X-Received: by 2002:a05:600c:3511:b0:499:a8bd:1930 with SMTP id 5b1f17b1804b1-499aa16c7b5mr81130405e9.5.1787150191149;
        Wed, 19 Aug 2026 07:36:31 -0700 (PDT)
Received: from claudiu-TUXEDO-InfinityBook-Pro-AMD-Gen9.. ([2a02:2f04:6400:1700:e978:dd1f:393f:9962])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499a9e37284sm32671235e9.4.2026.08.19.07.36.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 07:36:30 -0700 (PDT)
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu Beznea <claudiu.beznea+renesas@tuxon.dev>
To: geert+renesas@glider.be,
	linusw@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	magnus.damm@gmail.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com
Cc: claudiu.beznea@tuxon.dev,
	linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v5 3/5] pinctrl: renesas: rzg2l: Unify the power source handling
Date: Wed, 19 Aug 2026 17:35:51 +0300
Message-ID: <20260819143553.2478984-4-claudiu.beznea+renesas@tuxon.dev>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260819143553.2478984-1-claudiu.beznea+renesas@tuxon.dev>
References: <20260819143553.2478984-1-claudiu.beznea+renesas@tuxon.dev>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

The previous code handled power sources using a mixture of power
source specific definitions and lookups in the available_ps[] array.
Unify the power source handling by introducing
struct rzg2l_pinctrl_ps_desc, whose purpose is to describe a power
source through its power source value, associated register value,
associated capabilities (e.g. Ethernet), and associated IOLH index.

Introduce two new functions, rzg2l_ps_to_desc() and
rzg2l_pwr_reg_val_to_desc(), using the
RZG2L_PINCTRL_PS_DESC_MEMBER_TO_DESC_FUNC() macro, as their
implementations are similar.

These functions retrieve a power source descriptor based on either a
power source value or a power source register value. Other functions
that need to perform power source specific operations can call them to
retrieve the corresponding power source descriptor.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v5:
- none, this patch is new

 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 141 ++++++++++++++++--------
 1 file changed, 93 insertions(+), 48 deletions(-)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
index 9c935dc47555..6329742fda94 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
@@ -181,9 +181,6 @@
 #define SD_CH(off, ch)		((off) + (ch) * 4)
 #define ETH_POC(off, ch)	((off) + (ch) * 4)
 
-#define PVDD_2500		2	/* I/O domain voltage 2.5V */
-#define PVDD_1800		1	/* I/O domain voltage <= 1.8V */
-#define PVDD_3300		0	/* I/O domain voltage >= 3.3V */
 #define PVDD_MASK		0x3
 
 #define PWPR_B0WI		BIT(7)	/* Bit Write Disable */
@@ -286,12 +283,14 @@ struct rzg2l_register_masks {
 
 /**
  * enum rzg2l_iolh_index - starting indices in IOLH specific arrays
+ * @RZG2L_IOLH_IDX_NA: index N/A (to be used for error checking)
  * @RZG2L_IOLH_IDX_1V8: starting index for 1V8 power source
  * @RZG2L_IOLH_IDX_2V5: starting index for 2V5 power source
  * @RZG2L_IOLH_IDX_3V3: starting index for 3V3 power source
  * @RZG2L_IOLH_IDX_MAX: maximum index
  */
 enum rzg2l_iolh_index {
+	RZG2L_IOLH_IDX_NA = -1,
 	RZG2L_IOLH_IDX_1V8 = 0,
 	RZG2L_IOLH_IDX_2V5 = 4,
 	RZG2L_IOLH_IDX_3V3 = 8,
@@ -440,7 +439,65 @@ struct rzg2l_pinctrl {
 	u32				clone_offset;
 };
 
-static const u16 available_ps[] = { 1800, 2500, 3300 };
+/**
+ * struct rzg2l_pinctrl_ps_desc - RZ/G2L power source descriptor
+ * @caps: Capabilities that applies to the power source
+ * @iolh_index: IOLH index
+ * @ps: Power source value
+ * @pwr_reg_val: Power source register value
+ */
+struct rzg2l_pinctrl_ps_desc {
+	u32 caps;
+	enum rzg2l_iolh_index iolh_index;
+	u16 ps;
+	u16 pwr_reg_val;
+};
+
+#define RZG2L_PINCTRL_PS_DESC(_ps, _pwr_reg_val, _caps, _iolh_index) \
+	{ \
+		.ps = _ps, \
+		.pwr_reg_val = _pwr_reg_val, \
+		.caps = _caps, \
+		.iolh_index = _iolh_index, \
+	}
+
+/* Keep the entries with .caps set in the first positions. */
+static const struct rzg2l_pinctrl_ps_desc available_ps[] = {
+	/* Ethernet I/O domain voltage 2.5V */
+	RZG2L_PINCTRL_PS_DESC(2500, 2, PIN_CFG_IO_VMC_ETH0 | PIN_CFG_IO_VMC_ETH1,
+			      RZG2L_IOLH_IDX_2V5),
+	/* I/O domain voltage 1.8V */
+	RZG2L_PINCTRL_PS_DESC(1800, 1, 0, RZG2L_IOLH_IDX_1V8),
+	/* I/O domain voltage 3.3V */
+	RZG2L_PINCTRL_PS_DESC(3300, 0, 0, RZG2L_IOLH_IDX_3V3),
+};
+
+#define RZG2L_PINCTRL_PS_DESC_MEMBER_TO_DESC_FUNC(_name, _desc_member, _caps)	\
+static const struct rzg2l_pinctrl_ps_desc *_name(u16 _desc_member, u32 _caps)	\
+{										\
+	const struct rzg2l_pinctrl_ps_desc *desc = NULL;			\
+										\
+	for (unsigned int i = 0; i < ARRAY_SIZE(available_ps); i++) {		\
+		if (available_ps[i]._desc_member == _desc_member) {		\
+			if (available_ps[i].caps) {				\
+				if (available_ps[i].caps & caps) {		\
+					desc = &available_ps[i];		\
+					break;					\
+				} else {					\
+					continue;				\
+				}						\
+			} else {						\
+				desc = &available_ps[i];			\
+				break;						\
+			}							\
+		}								\
+	}									\
+										\
+	return desc;								\
+}
+
+RZG2L_PINCTRL_PS_DESC_MEMBER_TO_DESC_FUNC(rzg2l_ps_to_desc, ps, caps)
+RZG2L_PINCTRL_PS_DESC_MEMBER_TO_DESC_FUNC(rzg2l_pwr_reg_val_to_desc, pwr_reg_val, caps)
 
 static u64 rzg2l_pinctrl_get_variable_pin_cfg(struct rzg2l_pinctrl *pctrl,
 					      u64 pincfg,
@@ -1105,34 +1162,26 @@ static int rzg2l_caps_to_pwr_reg(const struct rzg2l_register_offsets *regs,
 	return -EINVAL;
 }
 
-static int rzg2l_pwr_reg_val_to_ps(u8 val, u32 caps)
+static int rzg2l_pwr_reg_val_to_ps(u16 pwr_reg_val, u32 caps)
 {
-	switch (val) {
-	case PVDD_1800:
-		return 1800;
-	case PVDD_2500:
-		return 2500;
-	case PVDD_3300:
-		return 3300;
-	}
+	const struct rzg2l_pinctrl_ps_desc *desc;
 
-	return -EINVAL;
+	desc = rzg2l_pwr_reg_val_to_desc(pwr_reg_val, caps);
+	if (!desc)
+		return -EINVAL;
+
+	return desc->ps;
 }
 
-static int rzg2l_ps_to_pwr_reg_val(u32 ps, u32 caps)
+static int rzg2l_ps_to_pwr_reg_val(u16 ps, u32 caps)
 {
-	switch (ps) {
-	case 1800:
-		return PVDD_1800;
-	case 2500:
-		if (!(caps & (PIN_CFG_IO_VMC_ETH0 | PIN_CFG_IO_VMC_ETH1)))
-			return -EINVAL;
-		return PVDD_2500;
-	case 3300:
-		return PVDD_3300;
-	}
+	const struct rzg2l_pinctrl_ps_desc *desc;
 
-	return -EINVAL;
+	desc = rzg2l_ps_to_desc(ps, caps);
+	if (!desc)
+		return -EINVAL;
+
+	return desc->pwr_reg_val;
 }
 
 static int rzg2l_get_power_source(struct rzg2l_pinctrl *pctrl, u32 pin, u32 caps)
@@ -1191,32 +1240,21 @@ static int rzg2l_set_power_source(struct rzg2l_pinctrl *pctrl, u32 pin, u32 caps
 	return 0;
 }
 
-static bool rzg2l_ps_is_supported(u16 ps)
+static bool rzg2l_ps_is_supported(u16 ps, u32 caps)
 {
-	unsigned int i;
+	const struct rzg2l_pinctrl_ps_desc *desc = rzg2l_ps_to_desc(ps, caps);
 
-	for (i = 0; i < ARRAY_SIZE(available_ps); i++) {
-		if (available_ps[i] == ps)
-			return true;
-	}
-
-	return false;
+	return !!desc;
 }
 
-static enum rzg2l_iolh_index rzg2l_ps_to_iolh_idx(u16 ps)
+static enum rzg2l_iolh_index rzg2l_ps_to_iolh_idx(u16 ps, u32 caps)
 {
-	unsigned int i;
+	const struct rzg2l_pinctrl_ps_desc *desc = rzg2l_ps_to_desc(ps, caps);
 
-	for (i = 0; i < ARRAY_SIZE(available_ps); i++) {
-		if (available_ps[i] == ps)
-			break;
-	}
+	if (!desc)
+		return RZG2L_IOLH_IDX_NA;
 
-	/*
-	 * We multiply with RZG2L_IOLH_MAX_DS_ENTRIES as we have
-	 * RZG2L_IOLH_MAX_DS_ENTRIES DS values per power source
-	 */
-	return i * RZG2L_IOLH_MAX_DS_ENTRIES;
+	return desc->iolh_index;
 }
 
 static u16 rzg2l_iolh_val_to_ua(const struct rzg2l_hwcfg *hwcfg, u32 caps, u8 val)
@@ -1601,7 +1639,11 @@ static int rzg2l_pinctrl_pinconf_get(struct pinctrl_dev *pctldev,
 		ret = rzg2l_get_power_source(pctrl, _pin, cfg);
 		if (ret < 0)
 			return ret;
-		iolh_idx = rzg2l_ps_to_iolh_idx(ret);
+
+		iolh_idx = rzg2l_ps_to_iolh_idx(ret, cfg);
+		if (iolh_idx == RZG2L_IOLH_IDX_NA)
+			return -EINVAL;
+
 		val = rzg2l_read_pin_config(pctrl, IOLH(off), bit, IOLH_MASK);
 		arg = rzg2l_iolh_val_to_ua(hwcfg, cfg, iolh_idx + val);
 		break;
@@ -1797,7 +1839,7 @@ static int rzg2l_pinctrl_pinconf_set(struct pinctrl_dev *pctldev,
 
 	/* Apply power source. */
 	if (settings.power_source != pctrl->settings[_pin].power_source) {
-		ret = rzg2l_ps_is_supported(settings.power_source);
+		ret = rzg2l_ps_is_supported(settings.power_source, cfg);
 		if (!ret)
 			return -EINVAL;
 
@@ -1812,7 +1854,10 @@ static int rzg2l_pinctrl_pinconf_set(struct pinctrl_dev *pctldev,
 		enum rzg2l_iolh_index iolh_idx;
 		int val;
 
-		iolh_idx = rzg2l_ps_to_iolh_idx(settings.power_source);
+		iolh_idx = rzg2l_ps_to_iolh_idx(settings.power_source, cfg);
+		if (iolh_idx == RZG2L_IOLH_IDX_NA)
+			return -EINVAL;
+
 		ret = rzg2l_ds_is_supported(pctrl, cfg, iolh_idx,
 					    settings.drive_strength_ua);
 		if (!ret)
-- 
2.43.0

