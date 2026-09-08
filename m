Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9324A55931A
	for <linux-renesas-soc@vger.kernel.org>; Tue,  8 Sep 2026 14:58:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788879518; cv=none; b=N2trS9wEzEy0iAsBIO3C6kidpZgIWvTd5t0Tl+tZ3k8UstIBtnTYiBrVMQyHB2xCOMuiYthwjMoZ2onz3ZqpdUC5yzOgeNGB1saZ2g9xn0Klofdu+1NMpG9QN9r2ibxrtIVEGFf0LDLgHnu2ZTzhHddloTPkuRMY4iBFWAV9TKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788879518; c=relaxed/simple;
	bh=Rq+TDPdqhF6BqR973VgYSIdLvxRoWPIkY3OnfX0xzLQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jLjOSu5RaELQXZ+zYg2H0ompa8lQPlQVRHDDp2NB9cbCgHNB/ocZKHk9h+OIzh2Vs2+OK7hQHCI+uwtjOBwsh3VBr5V4F45yZAq3LZeEpz1mxvBupFTbrvPGT3PuDazzxMjNg3Ix0tzrTpETHjb17ur8JZ7wnf4kjTslayFljBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TlfY/+70; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MNhhhJJ5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TlfY/+70";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MNhhhJJ5"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 688EjCTW3192346
	for <linux-renesas-soc@vger.kernel.org>; Tue, 8 Sep 2026 14:58:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RyU4Ifafpyh/FLtyPoayXjzPbwMU/X5o2UFaqrYzldE=; b=TlfY/+70lYPBwKfG
	8C+dPQvcTQV5IWcBhMbPO3VQCQZbx9FGQlPPtyxXFmZ2ZPNkrjBxPpSwG8FxPQRX
	IkPviXWaBMs5F7rOTPVAklbcam91LZ5oLtPhuhV27it6Ai6880PRcG6CqxGaf9Ix
	kCawijrWOm5I+qk/2ewAvYYCZd175r699olAl6bWXKgp102LwYvOsdFY31olu5SZ
	Ug6q/2vRt+a5KBrUdSgr02i9M5w5Vbe13ToeJ2JPg2U2XESm5HdG5WY7tLgMbfgt
	hIgwfGrq5kBar8GOh6Be2mUM+m5MDsCFQGeVHzke756Waxuz8EejSIJxKkwieNvq
	qIa3sw==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjf1chjun-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Tue, 08 Sep 2026 14:58:18 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-78f2fe53829so221185137.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 08 Sep 2026 07:58:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788879498; x=1789484298; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RyU4Ifafpyh/FLtyPoayXjzPbwMU/X5o2UFaqrYzldE=;
        b=MNhhhJJ5aycibF+jR9fDmDWzYudicWiYk3/clcLywmKdeyxi2PJ5vPxnniuI93iPbL
         FX5FC7uFO9ZIHID6BWw1MigUMK7tUmrvLYn4rulFkHEELGO3BnxdVh9xS5F764WR9V7H
         6ReosSO8Wfs92CkYPwqLEwi0g4e99TTcXIAo1KfHch/xXiTyHfO501ss30SonBSpvXdd
         7PfY1JvEnroDlJwRPI5AVARVE0c9cM0pYGXwhSoasHy1ti/Y/+yzpmMbmA75zAs8KUHk
         x2jmZVXVosdnOOk0bk24d18WUKyaHI9cbMwXsU9jNhI5j160qOpWK7HFtUMG1VAkNKLS
         TyyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788879498; x=1789484298;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RyU4Ifafpyh/FLtyPoayXjzPbwMU/X5o2UFaqrYzldE=;
        b=LQpV0kD7HkiqN4vWqx76PA6UTHRQtmHkFQDtUrxny9jBB8c/BpDJN1s+7tbjMrwjN2
         8eapVNeBkac4edl/HDJWkWUyiGjXa1U1cIzgCx9IrAWobnBlGQ87FN52A0o285LfWTA9
         7Sgj/m2iHSAS5Sbo25lP0p+chOR4RumsAp0v+dxlpWQ/4gv3Va6U9cPdaUxYMM+xky4W
         mTwh0YfZ9so3yeeAqM2TSdpB3qYu95dOU2kiTMQnisvxx7BzN7K5VD2pMnQci9J46mv+
         aZtveTxnyhEZn7qcaUljKfB8B2wH6FIquW0oAu0sOOpYXuI0ZyceIe5NXvyo9vyFCwAq
         /E3A==
X-Forwarded-Encrypted: i=1; AKwUvBx5vXWrkN6fFTn4d1PWC4wDwh0Sq/Sc/qLLr8l2n2QXtIo1noahtoFFhKeFW2Igk9fsaOHt+xfEDHHFdoxlgR0kdg==@vger.kernel.org
X-Gm-Message-State: AFuF++l159IdNcRUv5vd9c7F8aLtCoVLdP+YHSagRNvpu0pRFr962hbn
	hRW61TVvl7bjBlzUl/e/pfQ5569BW97Vk8QmxWVWMfHEnQEbXAaRLI1Wgv3bEp9FM4FNgzRuYP4
	XW9fZGKhecHOu3rUJzsE3ZX91k3tCS8xarDEWA/Msr0bmJ2QWqVwAtVbwXvCxQgIVyvcpZ4/w+Q
	==
X-Gm-Gg: AYBFou1fLthiyxZ+rIaeHDdMG3KlcAobss26JO8yNrO7MAXpxJP1P043mwU7ujs+nbC
	lvBz2MilVB7i2J0pzt8QfwUlQoIqcETBj3jjKBT8ZdPs84ZC+291sN6mwJAMhGjRQ/5GB7Nx4g5
	7zjPnb3UUsuJMdn5LMScGSSCynCaBfghOWvAdXB20Qc4b22bd+ZjylycPtRIcP8H6ekKuHQitUK
	mLbanIbH+iuC7AxyV79lJEQYP1IDxRzXW39R38YTjpobLRJaao/reze5Gp8+zad10wqaOjomv2h
	/lXad4d1sNSSsPhUU1dZ8rh4ze5VpEBdleqV67j9jnLJh5ELwQr9JH9TBgawdIoRbhaOy9K+aLC
	DE/xXEouU55u/og6pRKuzAisT+3e1
X-Received: by 2002:a05:6102:54a8:b0:785:c960:ff85 with SMTP id ada2fe7eead31-78a4a8e5299mr12862073137.7.1788879494507;
        Tue, 08 Sep 2026 07:58:14 -0700 (PDT)
X-Received: by 2002:a05:6102:54a8:b0:785:c960:ff85 with SMTP id ada2fe7eead31-78a4a8e5299mr12862044137.7.1788879494031;
        Tue, 08 Sep 2026 07:58:14 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:79a2:f118:df09:fe51])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485958f1493sm25191276f8f.37.2026.09.08.07.58.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 07:58:10 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 08 Sep 2026 16:57:24 +0200
Subject: [PATCH net-next v14 05/10] net: stmmac: qcom-ethqos: set serdes
 mode before powerup
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-qcom-sa8255p-emac-v14-5-ec212b747a7d@oss.qualcomm.com>
References: <20260908-qcom-sa8255p-emac-v14-0-ec212b747a7d@oss.qualcomm.com>
In-Reply-To: <20260908-qcom-sa8255p-emac-v14-0-ec212b747a7d@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1365;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Rq+TDPdqhF6BqR973VgYSIdLvxRoWPIkY3OnfX0xzLQ=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqoCJr2HJy3rNOohKIofZRC/HrZwZ9P0zZOWRXQ
 S51BxunZFiJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaqAiawAKCRAFnS7L/zaE
 w1OnEAC2YRnquSZ8wqTHNjfW4N3WzbgI3U5rbMQqt5bXxKUwgjLXrFzhBTY8uZA1Uu0+YoP08u1
 hQ46nB7p89WKc1VrhJY1U3TBBxcnlyLqIkl2hqgHtf1fSMUN4qgDtlqVocrwtLo2m5B+ZkA+SNW
 BABXgXrQBkl+InavpYsVxDOsCYpsIkjcfcmemRkzzDrsydaAUlT8Ov9GJ2BYIOGg7WDuD4Rz+ik
 d+Y690KTRpYoKbThlgXcMVH24nuDtDCJNvpc1ldLVtyFga2uu6MbHTKv/6UbAFvDX+QPpMGFrAe
 Oy6Toa8Mi0W/hKPw3y8okYWSFMnIFgjaM4kxHqbSwGsaNVS0b+9EVcOCZtCExYoaUn9Pimgu3fT
 RtbsIwGW0KLpbisASrL4SCIbir8WO67kRTu+ghSfBbEDc6lZbBQ3rj1O2Of6YuerpwjRD3KvuGL
 ipmpqBLUgXTallF0viP/60sN8lmlCHK/P40dgJmAQqQDeJ8FPkbVhTaFywQtHpXvZqHlH8Z4PAu
 vYOZLTFTPtfeOKLdmOcry2ULa5ykPNwawmv9hfmoKv37Jms7ueFEvSgx6/1ZJOGmzQQ7BGMKch5
 F+tv2Ty8o6jwM4rTrDx8+PYus1TZZCr5JRunxR90WQ1+tThTC+LYar9fGlOy+BPfOTWZf4VN7WF
 5ZP/X8M2ZwFQnFg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=VN3tWdPX c=1 sm=1 tr=0 ts=6aa0228a cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=lIIuVyqIMTwqdMfQNTsA:9 a=QEXdDO2ut3YA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-ORIG-GUID: FjALu0FMMVJ0i5L3C5Q6UWCqB-X6Z2v_
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDE2MSBTYWx0ZWRfXxLmDUHrkg9eP
 of/1iw43MPFb9Ou4Fu87Olmg31VzgiuKhBY34YDuz92RdJoiHbzrvNPJufKJyZbYDYytmXubzY3
 mbcYyRApEq3TYlglrpwPh74L8bLJJBs=
X-Proofpoint-GUID: FjALu0FMMVJ0i5L3C5Q6UWCqB-X6Z2v_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDE2MSBTYWx0ZWRfX9s4sujBqY0xx
 I2kzm5CTzHfftrki0LpunqEUSPBuPbmdXKns1Twa3DYFB01B3GuwJRU+6iV4XSQ9FRI5o0o9Cxl
 r6t33C+i7Lsm0BV1hsggVO0vlifJin1mQfI/wuhNiPhf6SI152dudhq+sNECmn4UkBSXeQwNoth
 2vIpaqkEFtH3HXTdJXD5bqTDTGbYisZPISIfjYWkaeviCbyEoLUsTTebn3gVzibFPH6QkpdrTlo
 QqTdsXPIYZ/JTdfNktvSrrHsweS9CL3BQbA+RFdcFfSsOaRf+WIEICQMk7AeFgi+zydKcASBM0A
 XIwWmbhaofBgHB5znU6wBRA/kzQZDz9+RFd0DHxpxZSHIR77sZo6CFTfRbqfT4ECz8raqT/dMG6
 lmrXZ+NTdm7CorKWzf9ed4uRLsuYGqNbqM/gx/7jsmzBZ2ZY8yTIpPB8xVPuLjnSK5dDVS13XBS
 ILYBrN4rMf3d4JTm3Qw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 suspectscore=0 clxscore=1015 impostorscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080161

Call phy_set_mode_ext() before phy_power_on() in
qcom_ethqos_serdes_powerup(). This is harmless for existing users but on
SCMI systems this is required for the PHY driver to select the right
performance level - which translates to the link speed. This is done
ahead of adding support for the firmware-managed EMAC on Qualcomm sa8255p.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index ac7d6d3e205a1ab5b391def879d6f1033a0961b6..47b70b5e706f221c01f1c0ae3b1acafae6641165 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -601,10 +601,19 @@ static int qcom_ethqos_serdes_powerup(struct net_device *ndev, void *priv)
 	if (ret)
 		return ret;
 
+	ret = phy_set_mode_ext(ethqos->serdes_phy, PHY_MODE_ETHERNET,
+			       ethqos->phy_mode);
+	if (ret)
+		goto err_out;
+
 	ret = phy_power_on(ethqos->serdes_phy);
 	if (ret)
-		phy_exit(ethqos->serdes_phy);
+		goto err_out;
 
+	return 0;
+
+err_out:
+	phy_exit(ethqos->serdes_phy);
 	return ret;
 }
 

-- 
2.47.3

