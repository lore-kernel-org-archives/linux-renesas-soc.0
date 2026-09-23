Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B17F53E31C
	for <linux-renesas-soc@vger.kernel.org>; Wed, 23 Sep 2026 15:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790176529; cv=none; b=SFnnkBgyRMBXl9aBrN7YvP0SId3EcmVRXyThJL2YH2lEbWyk0wliggyOG586HYvKyQTX6/yloQ55Ms5F6STXnCVd1s/3Ln1gN8WjyXKrmiLkmXt3C8IkoLxEgdYbe0KO0CIViZnqNzPAX1cdlmr5gA0CeEwtjiJWhpjjTPpbZbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790176529; c=relaxed/simple;
	bh=t8otp0UprQhPEc27ImF7K2VwOwzg/wYCq64pw1qmrCM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bDov6B2/lEteSttWGcRGuWSk7pGwVHWJotKgiAm7sBr7WkdBZGVaYc/kjpjRoJe/n6mtbbBcsYtBZ8GgFTtVf0zW11g2J1NDn9d5zXdNNwGIatDB+O5vIZ7WFQc36oTBZxjhPY6nKVVaJzSil/ymOJLCHxeqZdDoN1GANpVRkkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JRSw9gHf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dJIT4evO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JRSw9gHf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dJIT4evO"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NDKqD92056311
	for <linux-renesas-soc@vger.kernel.org>; Wed, 23 Sep 2026 15:15:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	37soDkv7vOtc95esEyY4ccUtIDMgJqrjFnjzotH9yLs=; b=JRSw9gHfksg88Qsw
	N6ZIdbTQRXx/1fkxcWYaIMUbHvUMs9Ay2q8ex07vCBv5ce0kyLXKG4wcDn67DMnk
	BX7tlRuXwPVrXVAEleHZTD2c1PzsDrN+34cNJBoQHdaCA58jPzBKhzfvXGjJ7Vdy
	Cieri7vNBZSrGbxDTaHjT3reAehRtAStPq4g5Vn46f2acTrEDIgOJwt41O0aS+hm
	RyZcOaNLzBO5s0ruqu+eRHQ9yBWr/ji1M8yL2frfH20T+wv2ZtIQ839v1eMyoxvl
	A8v7vCIa1qHu4VVrTYQg+7nYnieAJRhYEDmi+5V0Qx1oa847yNImud/w4FJOsqgY
	o7lJBg==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvfjv0hgb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Wed, 23 Sep 2026 15:15:22 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-98304865f02so876125241.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 23 Sep 2026 08:15:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790176522; x=1790781322; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=37soDkv7vOtc95esEyY4ccUtIDMgJqrjFnjzotH9yLs=;
        b=dJIT4evOPfK4o4ssuWURq+gIzErTkug3MqV+R22rAL2u+pal1/m/65bR+825aeWU54
         BJiTpyuWru80QUXq4GZViqpMTte5JrykVJorvRc5IcgJHSjn81x17b7ScbmmdEFv1Fth
         +odQd9FqU1/i/zgbtOY855LxZ5STPaBXuewIBtgB/iA0h6sh1+OuEHUh/Dnp8ucNxPbr
         DwTNSfrQXkSlbKZoT+I4K1lgfiTgQp+lsuFJ/aTCQ7TEgL1mmp6drYSNM3w8Qv0wpmca
         8p/TPvBOnXx8sNBn1zMJGpJ0zd3VvCi2/DWo+J6fKz8NV/UfEA6ggsbNPvjnnzHefG2R
         0J3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790176522; x=1790781322;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=37soDkv7vOtc95esEyY4ccUtIDMgJqrjFnjzotH9yLs=;
        b=Rqs7bHJDgJnhI7IZBaPnQDZbOdHVrv7R2+djqmnmt2t6m5B1lJ3zzGePr+KF9qez0T
         zBWBb7EMf9Ojd/LkBuikJ1bhfKYLS6wATw6t73d6kCCXhelem12BK5/LGRdze+Dk2YKY
         B0ApKPOgKk/BSkJdCXaTKzsi9mDIUvmoFLIMOsQxiufC80m5vjTqb2YY2olR2yFWECUN
         f/Kt08PHD1bEpi4qqNZZ/GEu7ABZIU22HJ8xJjcuLdjblJdUG8byV1OMS+sizZDjI7XL
         2C8bJxFJ9BZhQw2J3I/BZkQQ3kdQlNCVDzCuJeavCkyJsxD/W5PLGY9sdJZouqY0MfT0
         ogzw==
X-Forwarded-Encrypted: i=1; AKwUvBzB3mrAizPKjOpx0rcUDWQZGlCdSvQo0SKq4y9QdGNW0NjwN0JCmoTKwUeayOWH7rMmyFEKfX7cYIRIcbKE/brPdg==@vger.kernel.org
X-Gm-Message-State: AFuF++nPlo1qsJVajojlgRdzNr9oNPyyLxQAJ6CslzS3prK6wXm03dMx
	M1FMRz2p24yiP4d6Pg2btrYlXr4p9HgRYkypFUFJdCrlfmkj6sy5eq/Ye/VvG0cDrcWEUxUSqab
	MJklDIyFpY3tfryf66hZXlSpie4GmWUbK1u5/FekGftWWQRe8HHP3JAuJORNdW8MjKEOwzYzYBQ
	==
X-Gm-Gg: AYBFou0yHs91FWVkAvmIsCbKT7r8md4BBkxhqCnx+BRNCmmo263GuISUTczqgXlfBHf
	CilAbkcRjcH/VzJkwiXJ+LsoE/KA9rJLtH6U/RRw6mmCDTxGlVA3gWaW0P1QmG1R1jXEhtu1NSg
	ImvgyLmtPt+juudxs1oHuVnpqSJet6n1C7iYhmpabdzzTvRYlnjf+RnQWNADo+q19EwdLG4jad9
	Jgq7rrpgpAxF7YknL/l5EYOnHnqgLVZYnGwFt7JvvBYWdVjakgm2K0unIBWRZqhUxnqc0BAvuuI
	q401GbAv4x2IaIt0+jkuElQ3HlW2gq3O5fo3jW4wi5YljZZOPUE4ZeIzi8Jix/7frGxgWAqunVM
	YmGWhPk7zIqFCceYbjIUGF4SbrL3jE3z1A6c2NOE=
X-Received: by 2002:a05:6122:f90:b0:5c9:a60c:2739 with SMTP id 71dfb90a1353d-5c9f167a1famr3436259e0c.17.1790176521587;
        Wed, 23 Sep 2026 08:15:21 -0700 (PDT)
X-Received: by 2002:a05:6122:f90:b0:5c9:a60c:2739 with SMTP id 71dfb90a1353d-5c9f167a1famr3436135e0c.17.1790176520881;
        Wed, 23 Sep 2026 08:15:20 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:34c6:dbd6:5b58:a3fe])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe0c4054fsm55126325e9.3.2026.09.23.08.15.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 08:15:19 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 17:14:41 +0200
Subject: [PATCH net-next v15 7/9] net: stmmac: qcom-ethqos: reuse the
 address of ethqos_emac_driver_data
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-qcom-sa8255p-emac-v15-7-e82f33720737@oss.qualcomm.com>
References: <20260923-qcom-sa8255p-emac-v15-0-e82f33720737@oss.qualcomm.com>
In-Reply-To: <20260923-qcom-sa8255p-emac-v15-0-e82f33720737@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Vinod Koul <vkoul@kernel.org>,
        Giuseppe Cavallaro <peppe.cavallaro@st.com>,
        Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>, Shawn Guo <shawnguo@kernel.org>,
        Fabio Estevam <festevam@gmail.com>,
        Jan Petrous <jan.petrous@oss.nxp.com>, s32@nxp.com,
        Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
        Romain Gantois <romain.gantois@bootlin.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Maxime Ripard <mripard@kernel.org>,
        Christophe Roullier <christophe.roullier@foss.st.com>,
        Bartosz Golaszewski <brgl@kernel.org>, Radu Rendec <radu@rendec.net>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Drew Fustini <dfustini@tenstorrent.com>, linux-sunxi@lists.linux.dev,
        linux-amlogic@lists.infradead.org, linux-mips@vger.kernel.org,
        imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
        linux-rockchip@lists.infradead.org, sophgo@lists.linux.dev,
        linux-riscv@lists.infradead.org, brgl@kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5580;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=t8otp0UprQhPEc27ImF7K2VwOwzg/wYCq64pw1qmrCM=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqs+zqJdKQLT3kgkxuoLKDYmAZKJ8awFaUBTtwW
 s9Dw0UlefuJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCarPs6gAKCRAFnS7L/zaE
 w5fVEAClmsIFOqD2eSakxDBGvKI2IkGXhpQSX+NyQ1nAfxyxTdGYE9togbFFyeMNpWh/36r1D10
 OJ8aPAKyntdp1JaJUytuUuUSpndi98YrXV2ziu48uMXVvekAkxk+BzpfQOoLJXnF6cLYssvwPl+
 gNSnYU1kV6asKEdfkIsINhPXnka0cF8BLgqj+MasxjRfYMSxA3ONzUWKiQQ4pZRyak1LhTtEiYY
 dI1h8GxbBNnE/K/U+7jhD28w6zW5nS1+Wp0NRY+WHNVoH6If+uAWm3Elhh2yFkR48kmQxRmWQDr
 XOoXvC5OpgQ/ckOyzvddVkiGdwye8Jq0lVXvWv3zv2x4uJjKno2hUASosWFGDVqVpf6bvfzzsG9
 IN1jB4M7DeeJpwJbyiSVTsqMmmtZXbIrYyToBzDJZB5kjYEY3wcLTA58RUE/LwbwUEBYxLi49bJ
 XiKNEPDBUa3BNMtbQlnB/wpOdZIg+TUZQA7Oaw5nO84BA9UD8S0FVfx7nj6xznB8nY3U4knMYN2
 aVIifs4mXZreeG8ydGpV9ZEJ+VM5VYT9wQtG4kSC2Gu/S93ZZ/x5iGwdPiXf8xJf2AtHa52kHej
 Otvl8kAb+QPX7rjmOb2NijCtcHWpMyUijq3I72rdIK2kMS8rZ6pZcc3Pt4WfkHta91krio/p1M0
 cmqZGAgdL4kRTHQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA2MCBTYWx0ZWRfX2MJ/WLWjpmSo
 HfoAUFTXYWHxVgCT1oxE5cKy0ZKmvD6YlpTGQ3rnAd5i9Zo9NOBWVxc1l/GG5f0B4Lr21pg78sH
 Uf/ZNnIQIegYPT+lkh2VS5zsuBiTI8CGIDgMO4Q4RnHA+GZqdZMqknP0+RJAOLKxLTfCd2eKjkD
 ohAGPoQuPfOUYqWLl1jcQQMS4/66NNAhL3Up/+ushgzF2uhIJZYgaCSWIuacVIHSUXhMwPDXKL3
 8QCNXi7FaEIqJgoxZfPe/Ssu9p2f6RDIUhCj1QkV5QGz6ocev7X2Gn6Ake35lCvDeeYR4AkuG46
 /WRJA7Okv16xGcjmYgHXzasd8OJ82ABJ6t9guWgfGXeJZdrkmc5Gstpk7x8oFD1aVBmGwHIigS7
 KfNMzFCDU6Ob+h5Zv1v9dPuOFi5EH7P2RTBV50vgmUvz4aXDniEhlFdpUib9EH/FBK12S4lLUXR
 2JDsfXm2p2WBww6xlQQ==
X-Authority-Analysis: v=2.4 cv=aIxlOr9m c=1 sm=1 tr=0 ts=6ab3ed0a cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=7cvh1xCDNGPN4v1KGpUA:9 a=QEXdDO2ut3YA:10 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-GUID: dEVsAlLR4fdQytfIenKBw1t1h_wGSlab
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA2MCBTYWx0ZWRfXwghnOgXy28CV
 nomNmtHy1c0eM1cgt075ZdI4otSaai3AMxhzqCeWEEEq8KXh82vtl4WocT2n3a2FsrKHEojiBLU
 4FU6MHdajKmx4wllkNSpHKVHC9JFzJQ=
X-Proofpoint-ORIG-GUID: dEVsAlLR4fdQytfIenKBw1t1h_wGSlab
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 priorityscore=1501 spamscore=0 phishscore=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230060

Instead of needlessly copying the fields of ethqos_emac_driver_data into
struct qcom_ethqos, just use the address of the former as a reference.
It's .rodata after all. This is done in order to avoid having either two
calls to of_device_get_match_data() or having to extend the latter with
another field when adding support for SCMI.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 37 ++++++++--------------
 1 file changed, 14 insertions(+), 23 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index e067ceee016217c49d3b3d572fd9f33e562d1a75..ab1bcb7eb18e22f01556c190f7d8cd8eeba4d0c9 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -103,12 +103,7 @@ struct qcom_ethqos {
 	struct clk *link_clk;
 	struct phy *serdes_phy;
 	phy_interface_t phy_mode;
-
-	const struct ethqos_emac_por *rgmii_por;
-	unsigned int num_rgmii_por;
-	bool rgmii_config_loopback_en;
-	bool has_emac_ge_3;
-	bool needs_sgmii_loopback;
+	const struct ethqos_emac_driver_data *data;
 };
 
 static u32 rgmii_readl(struct qcom_ethqos *ethqos, unsigned int offset)
@@ -189,7 +184,7 @@ static int ethqos_set_clk_tx_rate(void *bsp_priv, struct clk *clk_tx_i,
 static void
 qcom_ethqos_set_sgmii_loopback(struct qcom_ethqos *ethqos, bool enable)
 {
-	if (!ethqos->needs_sgmii_loopback ||
+	if (!ethqos->data->needs_sgmii_loopback ||
 	    (ethqos->phy_mode != PHY_INTERFACE_MODE_2500BASEX &&
 	     ethqos->phy_mode != PHY_INTERFACE_MODE_SGMII))
 		return;
@@ -323,7 +318,7 @@ static int ethqos_dll_configure(struct qcom_ethqos *ethqos)
 	/* Set DLL_EN */
 	rgmii_setmask(ethqos, SDCC_DLL_CONFIG_DLL_EN, SDCC_HC_REG_DLL_CONFIG);
 
-	if (!ethqos->has_emac_ge_3) {
+	if (!ethqos->data->has_emac_ge_3) {
 		rgmii_clrmask(ethqos, SDCC_DLL_MCLK_GATING_EN,
 			      SDCC_HC_REG_DLL_CONFIG);
 
@@ -353,7 +348,7 @@ static int ethqos_dll_configure(struct qcom_ethqos *ethqos)
 	rgmii_setmask(ethqos, SDCC_DLL_CONFIG2_DDR_CAL_EN,
 		      SDCC_HC_REG_DLL_CONFIG2);
 
-	if (!ethqos->has_emac_ge_3) {
+	if (!ethqos->data->has_emac_ge_3) {
 		rgmii_clrmask(ethqos, SDCC_DLL_CONFIG2_DLL_CLOCK_DIS,
 			      SDCC_HC_REG_DLL_CONFIG2);
 
@@ -433,7 +428,7 @@ static int ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos, int speed)
 	rgmii_clrmask(ethqos, RGMII_CONFIG2_RSVD_CONFIG15,
 		      RGMII_IO_MACRO_CONFIG2);
 
-	if (speed == SPEED_1000 || ethqos->has_emac_ge_3)
+	if (speed == SPEED_1000 || ethqos->data->has_emac_ge_3)
 		rgmii_setmask(ethqos, RGMII_CONFIG2_RX_PROG_SWAP,
 			      RGMII_IO_MACRO_CONFIG2);
 	else
@@ -457,7 +452,7 @@ static int ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos, int speed)
 		 * in practice this becomes PRG_RCLK_DLY = 52 * 4 /
 		 *  (2 * RX delay ns)
 		 */
-		if (ethqos->has_emac_ge_3) {
+		if (ethqos->data->has_emac_ge_3) {
 			/* 0.9 ns */
 			prg_rclk_dly = 115;
 		} else {
@@ -473,7 +468,7 @@ static int ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos, int speed)
 			      SDCC_HC_REG_DDR_CONFIG);
 	}
 
-	if (ethqos->rgmii_config_loopback_en)
+	if (ethqos->data->rgmii_config_loopback_en)
 		loopback = RGMII_CONFIG_LOOPBACK_EN;
 	else
 		loopback = 0;
@@ -496,9 +491,9 @@ static void ethqos_fix_mac_speed_rgmii(void *bsp_priv,
 	dev = &ethqos->pdev->dev;
 
 	/* Reset to POR values and enable clk */
-	for (i = 0; i < ethqos->num_rgmii_por; i++)
-		rgmii_writel(ethqos, ethqos->rgmii_por[i].value,
-			     ethqos->rgmii_por[i].offset);
+	for (i = 0; i < ethqos->data->num_rgmii_por; i++)
+		rgmii_writel(ethqos, ethqos->data->rgmii_por[i].value,
+			     ethqos->data->rgmii_por[i].offset);
 
 	ethqos_set_func_clk_en(ethqos);
 
@@ -512,7 +507,7 @@ static void ethqos_fix_mac_speed_rgmii(void *bsp_priv,
 	rgmii_setmask(ethqos, SDCC_DLL_CONFIG_PDN,
 		      SDCC_HC_REG_DLL_CONFIG);
 
-	if (ethqos->has_emac_ge_3) {
+	if (ethqos->data->has_emac_ge_3) {
 		if (speed == SPEED_1000) {
 			rgmii_writel(ethqos, 0x1800000, SDCC_TEST_CTL);
 			rgmii_writel(ethqos, 0x2C010800, SDCC_USR_CTL);
@@ -539,7 +534,7 @@ static void ethqos_fix_mac_speed_rgmii(void *bsp_priv,
 			      SDCC_HC_REG_DLL_CONFIG);
 
 		/* Set USR_CTL bit 26 with mask of 3 bits */
-		if (!ethqos->has_emac_ge_3)
+		if (!ethqos->data->has_emac_ge_3)
 			rgmii_updatel(ethqos, GENMASK(26, 24), BIT(26),
 				      SDCC_USR_CTL);
 
@@ -750,11 +745,7 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 				     "Failed to map rgmii resource\n");
 
 	data = of_device_get_match_data(dev);
-	ethqos->rgmii_por = data->rgmii_por;
-	ethqos->num_rgmii_por = data->num_rgmii_por;
-	ethqos->rgmii_config_loopback_en = data->rgmii_config_loopback_en;
-	ethqos->has_emac_ge_3 = data->has_emac_ge_3;
-	ethqos->needs_sgmii_loopback = data->needs_sgmii_loopback;
+	ethqos->data = data;
 
 	ethqos->link_clk = devm_clk_get(dev, data->link_clk_name ?: "rgmii");
 	if (IS_ERR(ethqos->link_clk))
@@ -791,7 +782,7 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 	plat_dat->dump_debug_regs = rgmii_dump;
 	plat_dat->ptp_clk_freq_config = ethqos_ptp_clk_freq_config;
 	plat_dat->core_type = DWMAC_CORE_GMAC4;
-	if (ethqos->has_emac_ge_3)
+	if (data->has_emac_ge_3)
 		plat_dat->dwmac4_addrs = &data->dwmac4_addrs;
 	plat_dat->pmt = true;
 	if (of_property_read_bool(np, "snps,tso"))

-- 
2.47.3

