Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0E2153C3D7
	for <linux-renesas-soc@vger.kernel.org>; Wed, 23 Sep 2026 15:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790176531; cv=none; b=keBiHz13tPHT1jCuATcUCCAKfc2LLhU+tyjH1OKkzNNtg1sW/fRNoc/oZwEsO+oh3wauGTerIOmzLhx4hPcjryz1beXyfE011zogQZV8nJOpfj5+3ei8Y/Tu/Ly/tJcUzwQgQdGUalYraV/hv9ePayFPEliTumWjj4nTXdB8aw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790176531; c=relaxed/simple;
	bh=tpTcvMP4H52TudHkrbQVYa2cd+espkFD2aaWl0S9lKg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oA49MI30QGD0/b1Ucg9oAy9Fg7MA9uuxPNQTWooelq4yk1nFEuD9o88SBs1OpgWveJcHs3rpMwRFLoyqGe6gBVmLdfv5bc3qxmI1Odh6a98cHbpJu4qlENUdEkeDk7kYa4pW59KjGCC0ePMlvhXy4kmt9bNs/rycZNd9rnz0aVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AaCpPBUm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B7OvqZsK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AaCpPBUm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B7OvqZsK"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NDKid9322210
	for <linux-renesas-soc@vger.kernel.org>; Wed, 23 Sep 2026 15:15:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Jfr6FHf4J3HKMLFr5umwwFEv12n51Ck9PHChu4Q8jgc=; b=AaCpPBUm1to8ix55
	YkhDFwNGndJEJ7L3tR8r37VpSQvubhHYsACyK6J90x4kkTaeCIUEb3S+P9NKkI40
	aTfl4kfGNFOglWyONfWlLouZ6GMsf7iGR6nWYEBGNex2aY2Iu9I+C4vAQc3aTuIu
	dIYH5326KgsmxdalAUoAGdqCJYkHtTZN2IV9ViXmpAkAwrqnYaD3fnVikctGLfgq
	WCDv91U06KYPaKN+mXGijS6SaM0l+KP5OX8QKLglxru/DmnP9+T46DjgTnp7XrTw
	27c0h4dWyOrxTZUaWBWMXzvNteUB28ZDzYh7VVSwEUW6x72CIQd2FaS5e3FHuozm
	YUVENQ==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvfjsghfp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Wed, 23 Sep 2026 15:15:26 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-79014f0b44cso975947137.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 23 Sep 2026 08:15:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790176526; x=1790781326; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Jfr6FHf4J3HKMLFr5umwwFEv12n51Ck9PHChu4Q8jgc=;
        b=B7OvqZsKmSZ+JyGVs3h2Hmv0AzkJ32dQi6rdhsqjLGq2KdBZiz8c1zXKAXqpCI2yz/
         7V/rNDCUU7ThpxE8gMj11sFUQu5+Wd8NaULjmhtF/LSsVFHfqlfllWSjBHS+aDh94U9M
         Wr+o62hbEqKsusi7QXZ3fKeXjOkT56kjFrq2wjT1NtGGgfKT2lqycQ8Gq6sPmPImbasT
         IjBk9HXV8+81zfSpmYUmxUFdxvF8T2NsqHD4T7hZ1XLxJUJmrZursGP876Y/+ccS12Aq
         nEymf1+VhYOA+ovib/N8L9pX+pLJlsKfff8ceEbUClxB4/n44v4M/PgQcx2DI5l1VeDG
         HWSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790176526; x=1790781326;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Jfr6FHf4J3HKMLFr5umwwFEv12n51Ck9PHChu4Q8jgc=;
        b=xzGWOf5Km/ZxH6T/hsAgx7Mfyg49Uv+YkSczL8wjnDVhzE9URRDCKf31+YfJDwzpbs
         jj34HBU7Ct8pR2VeloLJwn45b1ihtl+M/snDalynaF9d8vrbt0oBD7Y7x3sHzYgvDbxJ
         Em8ncvx+CKSMilvTk/Itt7detAdPJATgIonmSnMRDHLyAIb5g4SO8fikUJo1BcmueqqV
         ALpRtHI0fnP+T4r+1ORodv2SjURqcBzlUaHLkTfkg0+KXAVu0Rg8rjRhmQDHjQ/S3Ny0
         FtYNZ4hrCgUWcmveXrJGvhvAPIGL9xLba9neHXxbhLAwXlbiPgzE/IW0CqOkeEr4bRDB
         9nig==
X-Forwarded-Encrypted: i=1; AKwUvBxcw0J8QHbvvXnNs7AxvI8xgR22GcaUhB86KbDkDz7EVioK4gYinZVk2k7DgCnm8yKU0S/+vATbPRPhDQfAWBv+cw==@vger.kernel.org
X-Gm-Message-State: AFuF++lBJpXT8KfjOz63Jft3UBcg2imFjRJluobU3I9LwzlRhnYmzcDE
	3wTxGYsl0cOlp56nqzw0Muf6prHnHCeaC+g2GV0X6xXgcl+4P3JqxnMjKxDDeOPHTxdquM9qRTo
	C8qzexovQNeipWo5fbPhbF9UFs8r8Gw8rZoKxNVixcKdeL8G2NLG370LnlOaF8CbVOPdcHJ3TNQ
	==
X-Gm-Gg: AYBFou3EMeTPIik8YlReSVMztTLoECvsRZ3Sz/E9WwL5rmEnJWhVfu/roacn/9TAaMx
	3DygLMt5wZwF8jUJiCuNQJ10vUIhNMkBPhVK3x4xULUA+P1/dxaqR8DmmBUq8McGDTJO0KvUErV
	lTRGcj2M2/Hm0JNyzKlkqJX3aE9dCP4EIj5K+2V/DFPXx/2S41woKFGnrfKL1kup4nYKNkcXQ5A
	nhR3zUyvnCKUYMkocy2VRoGHPZX/H7NDu6KzzmJnVtzV4ErP2BdOY6/2h86HWJK4eXsAe8fRSPe
	z+Gw8scmWmy512Pbq99G7v5d+Wkvm4wDAGHJhBXVUHlmc7kdH2KNv+ogu0h0aPDPESRKS5UYpDM
	hmrB6UDqN/BGWgYpFMuNOjqU5gGLB
X-Received: by 2002:a05:6102:358a:b0:7a6:d9d1:7e40 with SMTP id ada2fe7eead31-7ac1d0cb288mr2726279137.22.1790176525347;
        Wed, 23 Sep 2026 08:15:25 -0700 (PDT)
X-Received: by 2002:a05:6102:358a:b0:7a6:d9d1:7e40 with SMTP id ada2fe7eead31-7ac1d0cb288mr2726205137.22.1790176524839;
        Wed, 23 Sep 2026 08:15:24 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:34c6:dbd6:5b58:a3fe])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe0c4054fsm55126325e9.3.2026.09.23.08.15.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 08:15:23 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 17:14:42 +0200
Subject: [PATCH net-next v15 8/9] net: stmmac: qcom-ethqos: factor out
 linux-level setup into a separate function
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-qcom-sa8255p-emac-v15-8-e82f33720737@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=7477;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=tpTcvMP4H52TudHkrbQVYa2cd+espkFD2aaWl0S9lKg=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqs+zrRXT0r3nORrAE8NQw4rLtEBcjIlno0f6qA
 Jkmx3rXApyJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCarPs6wAKCRAFnS7L/zaE
 w5khEACbMwxMUkqzjQHlIJH+xcBUNLHl2G7C65mfWmi4h5JRhBxmdEw2s7HDnHehyINdGbuOGRB
 Ufe1qzPwJNqILCPLaptvpLZAUOEG3+SevH/gNtbZhMB8ggqb5wwCk+vPtXy5Y4uTSxSpbGKOegf
 ZGea1R24JZ2evdDWTNF+dL+hJGJf8Ntt2n0icGtIzjvJKuXyA+DBRNydgPVYleWfHGJxdk0Abwy
 52zaRg+M705uHPKjgIGSLdDyTUR28Udvgqmmrx9JReKegmGO3SxmuXhYJHv680DUKL7KjsFNpmU
 yu3uGEwKVH6q9CVkE3cfPk3A3Jmg1nzDNlpp85WuSfHkUh6FufzwanQnSz55G1KVsfNq+p9Suao
 6NulKVm3cil1nx5tltt5h8DkMt0FsTrWj1G2bKo/sTovnlrr/MZ2YTd82L6AYij/TVAzl4puR44
 DoGWu+tIyhd4LF3NmuR4QLLGiZRLQVD9tUF0GBNk1pbk9yCCSLO669//hcLbU1V1kBjlqkjOXag
 Gm9jh8Jyamzpwr/vg66JwXaZGg9lVcZAT21obE3gSN0nCuUqUM/27X1Ik2LbCDyCeN6R+fVcx9L
 yf1yOS8WD4hf/+ztK+lwysiRbP+Lakj1rThTb57b6fBfPtzBRhQnB1w5e8ttAzTaG2CT/549vN2
 VIgxFNNJr1aX64Q==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA2MCBTYWx0ZWRfX8A4jvcGuYOh7
 6K2A20JGZLBb1t2iWBnMBhwd8qf0W80lXHJmJsZdPqCDglc4MC+PBv179bjSjMV71fqBh5PLaBm
 xE9JwzfFhiISSK8beRFQOyJMt9TzkMaqzR31Zu8a+ooFrEofLy6krkWSwiJ/Y351kFSy6zZbpPV
 e+8gQJPQWvsmMOQR9Ttol93DLruJwbesemblNmqSfknm770B+JNEEfndydTkVj/yc5t/JIrRVnO
 ffnWHDxvz1QcKFSt0bljW9aiYautLVcdzPMYzdCmYDbg4ExDWmZc2NtMhgFRIbpo8xM9hEM0M5n
 NlYwzhNYG8SVZ0+so1SVAWibPRdU1/SkcKCUilIPrBc8Pf/aqNjXuKYnMWtWS4ZAAF/XMiRRwSR
 zDf0x6VwTxlWlHIehrveJwS8im4si4tPIQ9jQjIGrhePWp5nqMYqGmGl4/T6Tq2USJY+YaPfFgg
 DNNtA/EQNsCbXZiwLPA==
X-Proofpoint-GUID: Aovtq2QEGBUyFuCbJ2rThzVkYsr2TgFU
X-Proofpoint-ORIG-GUID: Aovtq2QEGBUyFuCbJ2rThzVkYsr2TgFU
X-Authority-Analysis: v=2.4 cv=K4+3jCWI c=1 sm=1 tr=0 ts=6ab3ed0e cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=dj4JEN0qHmgdNMwDfcEA:9 a=QEXdDO2ut3YA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA2MCBTYWx0ZWRfX+UuA0XmSdwz7
 9DtnJf5fEOTcOBLgD7SKIpb5FGYQ93prrDk+gQpDjoTopf7HnbF55sppW/87GSmeNRkhqBf+6D+
 +feH/O51biY+WH5R55OFp3RpLcIn8/g=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 suspectscore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230060

Ahead of adding support for firmware-controlled EMAC variants, extend
the ethqos_emac_driver_data structure with a setup() callback, implement
it for the existing models and move all operations not required in SCMI
mode into it.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 99 +++++++++++++++-------
 1 file changed, 68 insertions(+), 31 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index ab1bcb7eb18e22f01556c190f7d8cd8eeba4d0c9..509a5368e69a8fa440bf3b4f58f7b09a683558f3 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -5,6 +5,7 @@
 #include <linux/of.h>
 #include <linux/of_net.h>
 #include <linux/platform_device.h>
+#include <linux/pm_domain.h>
 #include <linux/phy.h>
 #include <linux/phy/phy.h>
 
@@ -81,6 +82,8 @@
 
 #define SGMII_10M_RX_CLK_DVDR			0x31
 
+struct qcom_ethqos;
+
 struct ethqos_emac_por {
 	unsigned int offset;
 	unsigned int value;
@@ -95,6 +98,8 @@ struct ethqos_emac_driver_data {
 	const char *link_clk_name;
 	struct dwmac4_addrs dwmac4_addrs;
 	bool needs_sgmii_loopback;
+	int (*setup)(struct qcom_ethqos *ethqos,
+		     struct plat_stmmacenet_data *plat_dat);
 };
 
 struct qcom_ethqos {
@@ -200,6 +205,9 @@ static void ethqos_set_func_clk_en(struct qcom_ethqos *ethqos)
 	rgmii_setmask(ethqos, RGMII_CONFIG_FUNC_CLK_EN, RGMII_IO_MACRO_CONFIG);
 }
 
+static int ethqos_hlos_setup(struct qcom_ethqos *ethqos,
+			     struct plat_stmmacenet_data *plat_dat);
+
 static const struct ethqos_emac_por emac_v2_3_0_por[] = {
 	{ .offset = RGMII_IO_MACRO_CONFIG,	.value = 0x00C01343 },
 	{ .offset = SDCC_HC_REG_DLL_CONFIG,	.value = 0x2004642C },
@@ -214,6 +222,7 @@ static const struct ethqos_emac_driver_data emac_v2_3_0_data = {
 	.num_rgmii_por = ARRAY_SIZE(emac_v2_3_0_por),
 	.rgmii_config_loopback_en = true,
 	.has_emac_ge_3 = false,
+	.setup = ethqos_hlos_setup,
 };
 
 static const struct ethqos_emac_por emac_v2_1_0_por[] = {
@@ -230,6 +239,7 @@ static const struct ethqos_emac_driver_data emac_v2_1_0_data = {
 	.num_rgmii_por = ARRAY_SIZE(emac_v2_1_0_por),
 	.rgmii_config_loopback_en = false,
 	.has_emac_ge_3 = false,
+	.setup = ethqos_hlos_setup,
 };
 
 static const struct ethqos_emac_por emac_v3_0_0_por[] = {
@@ -262,6 +272,7 @@ static const struct ethqos_emac_driver_data emac_v3_0_0_data = {
 		.mtl_low_cred = 0x00008024,
 		.mtl_low_cred_offset = 0x1000,
 	},
+	.setup = ethqos_hlos_setup,
 };
 
 static const struct ethqos_emac_por emac_v4_0_0_por[] = {
@@ -297,6 +308,7 @@ static const struct ethqos_emac_driver_data emac_v4_0_0_data = {
 		.mtl_low_cred = 0x00008024,
 		.mtl_low_cred_offset = 0x1000,
 	},
+	.setup = ethqos_hlos_setup,
 };
 
 static int ethqos_dll_configure(struct qcom_ethqos *ethqos)
@@ -692,6 +704,58 @@ static void ethqos_ptp_clk_freq_config(struct stmmac_priv *priv)
 	netdev_dbg(priv->dev, "PTP rate %lu\n", plat_dat->clk_ptp_rate);
 }
 
+static int ethqos_hlos_setup(struct qcom_ethqos *ethqos,
+			     struct plat_stmmacenet_data *plat_dat)
+{
+	struct platform_device *pdev = ethqos->pdev;
+	struct device *dev = &pdev->dev;
+	int ret;
+
+	ethqos->rgmii_base = devm_platform_ioremap_resource_byname(pdev, "rgmii");
+	if (IS_ERR(ethqos->rgmii_base))
+		return dev_err_probe(dev, PTR_ERR(ethqos->rgmii_base),
+				     "Failed to map rgmii resource\n");
+
+	ethqos->link_clk = devm_clk_get(dev, ethqos->data->link_clk_name ?: "rgmii");
+	if (IS_ERR(ethqos->link_clk))
+		return dev_err_probe(dev, PTR_ERR(ethqos->link_clk),
+				     "Failed to get link_clk\n");
+
+	plat_dat->clks_config = ethqos_clks_config;
+
+	ret = ethqos_clks_config(ethqos, true);
+	if (ret)
+		return ret;
+
+	ret = devm_add_action_or_reset(dev, ethqos_clks_disable, ethqos);
+	if (ret)
+		return ret;
+
+	ethqos_set_clk_tx_rate(ethqos, NULL, plat_dat->phy_interface, SPEED_1000);
+	qcom_ethqos_set_sgmii_loopback(ethqos, true);
+	ethqos_set_func_clk_en(ethqos);
+
+	switch (ethqos->phy_mode) {
+	case PHY_INTERFACE_MODE_RGMII:
+	case PHY_INTERFACE_MODE_RGMII_ID:
+	case PHY_INTERFACE_MODE_RGMII_RXID:
+	case PHY_INTERFACE_MODE_RGMII_TXID:
+		plat_dat->fix_mac_speed = ethqos_fix_mac_speed_rgmii;
+		break;
+	case PHY_INTERFACE_MODE_2500BASEX:
+	case PHY_INTERFACE_MODE_SGMII:
+		plat_dat->fix_mac_speed = ethqos_fix_mac_speed_sgmii;
+		break;
+	default:
+		break;
+	}
+
+	plat_dat->set_clk_tx_rate = ethqos_set_clk_tx_rate;
+	plat_dat->dump_debug_regs = rgmii_dump;
+
+	return 0;
+}
+
 static int qcom_ethqos_probe(struct platform_device *pdev)
 {
 	struct device_node *np = pdev->dev.of_node;
@@ -713,23 +777,20 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 				     "dt configuration failed\n");
 	}
 
-	plat_dat->clks_config = ethqos_clks_config;
-
 	ethqos = devm_kzalloc(dev, sizeof(*ethqos), GFP_KERNEL);
 	if (!ethqos)
 		return -ENOMEM;
 
 	ethqos->phy_mode = plat_dat->phy_interface;
+
 	switch (ethqos->phy_mode) {
 	case PHY_INTERFACE_MODE_RGMII:
 	case PHY_INTERFACE_MODE_RGMII_ID:
 	case PHY_INTERFACE_MODE_RGMII_RXID:
 	case PHY_INTERFACE_MODE_RGMII_TXID:
-		plat_dat->fix_mac_speed = ethqos_fix_mac_speed_rgmii;
 		break;
 	case PHY_INTERFACE_MODE_2500BASEX:
 	case PHY_INTERFACE_MODE_SGMII:
-		plat_dat->fix_mac_speed = ethqos_fix_mac_speed_sgmii;
 		plat_dat->mac_finish = ethqos_mac_finish_serdes;
 		break;
 	default:
@@ -739,24 +800,13 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 	}
 
 	ethqos->pdev = pdev;
-	ethqos->rgmii_base = devm_platform_ioremap_resource_byname(pdev, "rgmii");
-	if (IS_ERR(ethqos->rgmii_base))
-		return dev_err_probe(dev, PTR_ERR(ethqos->rgmii_base),
-				     "Failed to map rgmii resource\n");
-
 	data = of_device_get_match_data(dev);
 	ethqos->data = data;
 
-	ethqos->link_clk = devm_clk_get(dev, data->link_clk_name ?: "rgmii");
-	if (IS_ERR(ethqos->link_clk))
-		return dev_err_probe(dev, PTR_ERR(ethqos->link_clk),
-				     "Failed to get link_clk\n");
-
-	ret = ethqos_clks_config(ethqos, true);
-	if (ret)
-		return ret;
+	if (WARN_ON(!data->setup))
+		return -EINVAL;
 
-	ret = devm_add_action_or_reset(dev, ethqos_clks_disable, ethqos);
+	ret = data->setup(ethqos, plat_dat);
 	if (ret)
 		return ret;
 
@@ -765,21 +815,8 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, PTR_ERR(ethqos->serdes_phy),
 				     "Failed to get serdes phy\n");
 
-	ethqos_set_clk_tx_rate(ethqos, NULL, plat_dat->phy_interface,
-			       SPEED_1000);
-
-	qcom_ethqos_set_sgmii_loopback(ethqos, true);
-	ethqos_set_func_clk_en(ethqos);
-
-	/* The clocks are controlled by firmware, so we don't know for certain
-	 * what clock rate is being used. Hardware documentation mentions that
-	 * the AHB slave clock will be in the range of 50 to 100MHz, which
-	 * equates to a MDC between 1.19 and 2.38MHz.
-	 */
 	plat_dat->clk_csr = STMMAC_CSR_60_100M;
 	plat_dat->bsp_priv = ethqos;
-	plat_dat->set_clk_tx_rate = ethqos_set_clk_tx_rate;
-	plat_dat->dump_debug_regs = rgmii_dump;
 	plat_dat->ptp_clk_freq_config = ethqos_ptp_clk_freq_config;
 	plat_dat->core_type = DWMAC_CORE_GMAC4;
 	if (data->has_emac_ge_3)

-- 
2.47.3

