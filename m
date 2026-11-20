Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795134374;
	b=s5Y98GAKD7EGJXIxcDfm8htLASDLouBQxjkw9lwULL5iRej/ro1f3wtMmYLo+qxvbIqY
	 ILgnqR6ouZMOMMjhLO8DMmBCpF+McT5T65yqQVaYJepIMByD/WfnbPv5yGTQ10iTQzFY8
	 BQzjZp2Qt1OZLnFoCljVzJP8RPunB5vPUV6wDTc7EWXb28U/LNEu5n5ygk6I4jX5o55Yh
	 XmZVyFDYIlbDR0A2edgY0LHnnYNscHT5HuqLssnWB4OKnU4vIvzHxmDj24JeMVgVZTWqR
	 INvqD+b8Tdkytq6ug37aFWbRm1vY+63nBGP798iEw/9tdCvIb/Iwqni35AtgpvKUc1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795134374;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=mOagZS7KAFKo44G+tzdlLS8PcffQ89K8YxtJsO34uKo=;
	b=UCXY9oDg+9w28RZd7+MNMc/UTjFOjqcjrYyMwrVi4VfsvoVSicFZ/5WmXFl//GJrmpB1
	 AUxnIAHMNfJUzLcaoB7ttevTZVh8eWkXdcbnFTua3CPw7+slysn3Fd0WBk9ukFjd3j+ir
	 MKQIdCqi3s82kx+nfuMplSmlcR6EIJBeBAdrPHMt8cgD7AtOH117W/fmVZhr/Mut230vF
	 NBpZBmRomNICXRZBhUhkWJV8y2GW9ykOHB5DmRLH1yRjZ2KshqbY5IxG4vDaUPmOGVv0i
	 mQsJYJYX8vuiKonJkvYK8bWV9AK2RivZm/3mIwQmPtf4J7HE8lEU2Cd0lg7Oct0gCMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xLHktkA4;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE051606A33A
	for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Nov 2026 00:26:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE051606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xLHktkA4
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-491846221ffso216791f8f.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 19 Nov 2026 16:26:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795134372; x=1795739172; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mOagZS7KAFKo44G+tzdlLS8PcffQ89K8YxtJsO34uKo=;
        b=xLHktkA4z+MREgOPIaJJMK0ppf56iAg34EROcEYPZDErtMcoCLZkusRo25bs7Lcfzg
         AND9tJqUhGMi1CJH/aTmGB13Ix04icIlcBBz+TKYY6BRVlaSXWhFvk03Yw6qe+iF531D
         f4joEXAW4puPL/fEhrAguYdMn4IZFPA50T3RxViYAH7YP0EI+8yQCacN1fakcOgGk4lb
         /fqPdXMW7/ZC5tG03rW3bxiVhnfa1lpsTRKW0CBwtyqCVIkTNcLEq3Eg8x7q/o3++sB5
         HMW2g9Q6Gk/PgnHsmmshl1rXa+fPuIqpU7Qlh6NdKquvv2yYPE5oyo8K3xV0s4vzn0Q1
         Ro1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795134372; x=1795739172;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mOagZS7KAFKo44G+tzdlLS8PcffQ89K8YxtJsO34uKo=;
        b=dEhiC6oNFXR56tEy9VV1kGeFx59Xyw4fQ6dx/C2i1flrNDXgpiccdIWr1iFsYtL70W
         1bbg+qbc57kN+dCd+JXSbyLzK0VK6r7JHKN5GyZzjUrNKTcCtJz9ytTewRtMJir7ZI8A
         NupyMTVyouKRCMDRiYUsNRbpkO+kioQwWnUwpLihVsHdI+o7Qqk0BIyHwxeXnu+A7fNs
         YTajOQ2GFMnd9hX0JuJkolFnV6ntxxuN1gxNI/M8XVtUohaeI2UhUUf8IEtsv+lS2I2D
         noYTdWuSnBhi9ks/5rayueo148sS1eg5kjiuoXvSR0k8GA/of+u+jTeaF1OU+LBC5zaH
         bZ+w==
X-Forwarded-Encrypted: i=1; AL+hErFTCx6XifBvWV5ZOdbUjDPAYx/9g6KRkbKrsEAbv1itlbmlPThaYwvOnGMeHB6uq9ZNPOQJIXs9vzqLAIfYvStGxg==@vger.kernel.org
X-Gm-Message-State: APuU4Z/7s2N+iW5pc2RawS/RO+1jNx1Vgu+19lc2/eLoV38M2kz4kmMO
	PuuKRjUyHsR5KeDDkmHHg/wVAG8rBw3Wxw6gfg/Vh2Feyq1XrQ1Zxep3
X-Gm-Gg: AZFdTZfH+Ki+HcUE/7B15rsgxpCIyCnK0ReyfxbF1O1kB7sJAQeLMiEbBcisuZPcl67
	AS3I6bhOeCpkF36oyUmOXqO/gIMfqLfCcKNW+YOzY800SBZfUj6M9GcviwZjVTRVvd1LWL/uKNR
	OYscoiFFLyv8ofZe/709XrB7i9P5nv+eBNLZmPsINTk25vY+LJ0C0721yfO2EVZrIGtR25x/EM9
	bCjKPYGJeXbH0bgxNvfyVPyekcPVuPaUOLtnRgamuDdp5RNwoxnkIjEUurd/AtC2nh72FGLoara
	/gpiHspq9b8LP+O6gwN97XRiD58YalMz3TWv8DkXzNm7xv1549d3o//QYwMRJOO2R2duePkEbW1
	wr7npeoW/DzCAWq4UZamut7AVALJWOElRGG7yyLr6gio99fYj+bECBFZdUBrGrSqw534ykj6/La
	YlmtTdpksxSMFjDUJUiv+WDmt81hi5ya8leClbSCQajM5tsv5EbnPU6nUUYOZERJljd69bpPRFj
	2Th2Udas1pMFS1pYSbT5+YDox6K3IyqXi1vU2LvOaAZTccuWLHTlV9/FZaN8Hi5VFvaGdEIzu+K
	V+Tn0ijN2D0POxRhmuz6bpRFLjkdMwzVmNwtQapxJsR3EC0nkv5Q1ylnvmtuiHh8EL9faCpIDdu
	9OsyZZhA/0U2IigzOmR19/IGY7c02Cx5oZt2qaVWe9fwizHieW7QhnNCskr5pU4Cf3IcMwxfp
X-Received: by 2002:a05:6000:2506:b0:48d:ba3b:af36 with SMTP id ffacd0b85a97d-4abb47b0f64mr2492662f8f.37.1795134371827;
        Thu, 19 Nov 2026 16:26:11 -0800 (PST)
Received: from iku.lan ([2a00:23c8:254f:fd01:c5c5:590b:f4b8:3e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6c340df4sm2629998f8f.55.2026.11.19.16.26.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 16:26:11 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <clement.leger@linux.dev>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Simon Horman <horms@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	Ralph Siemsen <ralph.siemsen@linaro.org>,
	linux-renesas-soc@vger.kernel.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH net-next v5 20/24] net: dsa: rzn1-a5psw: Get lookup table size from OF data
Date: Fri, 20 Nov 2026 00:25:30 +0000
Message-ID: <20261120002549.1908299-21-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261120002549.1908299-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20261120002549.1908299-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

The RZ/N1 A5PSW has 8192 lookup table entries, whereas the RZ/T2H
and RZ/N2H ETHSW have only 4096 entries.

Add the lookup table size to struct a5psw_of_data, derive the address
mask from it and use it in the FDB and ageing code.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v4->v5:
- New patch
---
 drivers/net/dsa/rzn1_a5psw.c | 10 ++++++----
 drivers/net/dsa/rzn1_a5psw.h |  4 ++--
 2 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/net/dsa/rzn1_a5psw.c b/drivers/net/dsa/rzn1_a5psw.c
index 7e9bc252d92a..c0c1f45852da 100644
--- a/drivers/net/dsa/rzn1_a5psw.c
+++ b/drivers/net/dsa/rzn1_a5psw.c
@@ -311,18 +311,19 @@ static void a5psw_phylink_mac_link_up(struct phylink_config *config,
 static int a5psw_set_ageing_time(struct dsa_switch *ds, unsigned int msecs)
 {
 	struct a5psw *a5psw = ds->priv;
+	unsigned int entries = a5psw->of_data->lk_table_entries;
 	unsigned long rate;
 	u64 max, tmp;
 	u32 agetime;
 
 	rate = clk_get_rate(a5psw->clk);
-	max = div64_ul(((u64)A5PSW_LK_AGETIME_MASK * A5PSW_TABLE_ENTRIES * 1024),
+	max = div64_ul(((u64)A5PSW_LK_AGETIME_MASK * entries * 1024),
 		       rate) * 1000;
 	if (msecs > max)
 		return -EINVAL;
 
 	tmp = div_u64(rate, MSEC_PER_SEC);
-	agetime = div_u64(msecs * tmp, 1024 * A5PSW_TABLE_ENTRIES);
+	agetime = div_u64(msecs * tmp, 1024 * entries);
 
 	a5psw_reg_writel(a5psw, A5PSW_LK_AGETIME, agetime);
 
@@ -511,7 +512,7 @@ static int a5psw_lk_execute_lookup(struct a5psw *a5psw, union lk_data *lk_data,
 	if (ret)
 		return ret;
 
-	*entry = ctrl & A5PSW_LK_ADDR_CTRL_ADDRESS;
+	*entry = ctrl & (a5psw->of_data->lk_table_entries - 1);
 
 	return 0;
 }
@@ -638,7 +639,7 @@ static int a5psw_port_fdb_dump(struct dsa_switch *ds, int port,
 
 	mutex_lock(&a5psw->lk_lock);
 
-	for (i = 0; i < A5PSW_TABLE_ENTRIES; i++) {
+	for (i = 0; i < a5psw->of_data->lk_table_entries; i++) {
 		reg = A5PSW_LK_ADDR_CTRL_READ | A5PSW_LK_ADDR_CTRL_WAIT | i;
 
 		ret = a5psw_lk_execute_ctrl(a5psw, &reg);
@@ -1357,6 +1358,7 @@ static const struct a5psw_of_data rzn1_of_data = {
 	.pattern_ctrl_base = 0x3eb0,
 	.vlan_res_vlanid = GENMASK(16, 5),
 	.vlan_res_portmask = GENMASK(4, 0),
+	.lk_table_entries = 8192,
 };
 
 static const struct of_device_id a5psw_of_mtable[] = {
diff --git a/drivers/net/dsa/rzn1_a5psw.h b/drivers/net/dsa/rzn1_a5psw.h
index 29d205e2331d..fd523fe7bf47 100644
--- a/drivers/net/dsa/rzn1_a5psw.h
+++ b/drivers/net/dsa/rzn1_a5psw.h
@@ -93,7 +93,6 @@
 #define A5PSW_LK_ADDR_CTRL_WAIT		BIT(27)
 #define A5PSW_LK_ADDR_CTRL_READ		BIT(26)
 #define A5PSW_LK_ADDR_CTRL_WRITE	BIT(25)
-#define A5PSW_LK_ADDR_CTRL_ADDRESS	GENMASK(12, 0)
 
 #define A5PSW_LK_DATA_LO		0x40C
 #define A5PSW_LK_DATA_HI		0x410
@@ -210,7 +209,6 @@
 
 #define A5PSW_LK_BUSY_USEC_POLL		10
 #define A5PSW_CTRL_TIMEOUT		1000
-#define A5PSW_TABLE_ENTRIES		8192
 
 struct fdb_entry {
 	u8 mac[ETH_ALEN];
@@ -241,6 +239,7 @@ union lk_data {
  * @pattern_ctrl_base: Offset of the PATTERN_CTRL register of pattern 0
  * @vlan_res_vlanid: VLANID field mask of the VLAN_RES registers
  * @vlan_res_portmask: PORTMASK field mask of the VLAN_RES registers
+ * @lk_table_entries: Number of entries in the lookup table (power of 2)
  */
 struct a5psw_of_data {
 	unsigned int nports;
@@ -252,6 +251,7 @@ struct a5psw_of_data {
 	u16 pattern_ctrl_base;
 	u32 vlan_res_vlanid;
 	u32 vlan_res_portmask;
+	unsigned int lk_table_entries;
 };
 
 /**
-- 
2.56.1

