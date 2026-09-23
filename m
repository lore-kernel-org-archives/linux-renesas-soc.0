Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B058653C3D1
	for <linux-renesas-soc@vger.kernel.org>; Wed, 23 Sep 2026 15:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790176506; cv=none; b=IpHeio/AYXlL8mrfikRV6jP9gTHt3H/rB4kCXdF14itBoAkewKZOSmlIf9PtqteBlTowKodXE08ZDFl0Kapzzlf1lB9EkbN9RerdrpquhZSoDvC6rAqhDLQdat0hCDZvwah7nvE3EdJEYOb2A6idjiDfuNINd0fNO0Bi4/aWk8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790176506; c=relaxed/simple;
	bh=48a0yspdUEk3xwkcjvTbhXXEU17F+t29neQdikkIdcE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=E0vvyuWrrYusr3L6+ELNQjaNjZKWjAvONgmGefNZcv/J++7IrSfMvfkUptYOIR01IXKEHSmf13uz+3jTXNFKC+0C2QW6jU++Wazql9WpxiYwl9gXkLE8Y+uMWhgiVGBj4+gBWrc9dfC1/Z9TQrBtXCIbt+aX/skOAcvbQWyWvi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N6R11wVD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BdITwPET; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N6R11wVD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BdITwPET"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NDKe2h322123
	for <linux-renesas-soc@vger.kernel.org>; Wed, 23 Sep 2026 15:15:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	L9UR2dTT1MgkrWsYz4e8MugIDq9vhO6USeCZW8zDLR4=; b=N6R11wVDDRegxGy8
	zyMG7bN81RYwU3rXgmPicR8oDXcCtY8JyyUggDfZSfhdKPkwuVHhi/530+B9Ob0U
	oLDa4tcmSeYyDmcq91IqcbpQCsjvSltj1ZoTMtStLasx00kYxlvwdbmbd1JomxPB
	Od99UE67F8+vsgs27anJix93oASB79NCwRFmyUVxpiA2ltsY8Of6TeKECpTgGH2v
	DY3hqpHwgiR0Ea8jmJR9kb6PiGMaGvJNwtGuzUl5LjKX4jywoQ+K4KD7u1liSQVo
	PYCwDpBWituC8qt+AUwiKABucs2nPcIzVs6aPOEKwPFs3LK3xEUiNqhkKiMXLEK0
	UpLodg==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvfjsghae-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Wed, 23 Sep 2026 15:15:01 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-97cb32961e3so754685241.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 23 Sep 2026 08:15:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790176501; x=1790781301; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L9UR2dTT1MgkrWsYz4e8MugIDq9vhO6USeCZW8zDLR4=;
        b=BdITwPET0rBW81WWl/lh5M5p8vEwQldpgg7LKbw3AQzvNA2++uDMtR27uMYVUcl6ph
         HAbjSsXm4aRLINTLsHR7FOxqExD1qdmr3vvLNasfqGNlib3rXoq83DuFVK3mR+sIVM/+
         F/KpRQY16HnUQvaNCiGc7msK39nOM2KuCkNRQQ2VI8qfJdTrpZVdY7gNZHzwsuKlk5RZ
         JuY1aKsTxyHNmTH8mQh4q/iCgKrgi/Gz40JBsmLInL+WiLPCOgiLagm5W1F82rWthd98
         DK7xkeAmzZkPCzw0lPRQsp3CFiw+AVktQrUV04zCY8VBVkgCgSrktSt0/EAcGXBlqR1q
         jZcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790176501; x=1790781301;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L9UR2dTT1MgkrWsYz4e8MugIDq9vhO6USeCZW8zDLR4=;
        b=nfNf4YLHbdm2EjPrZ/NWuPa/EKAYMendLlirQYXXJl6MEtjCSoD5lRB2PxbM7ts3A+
         PRWWg8sE7zAL6tIATErhuhfZpggnMIQJpoT0XhJGGJ0eIf6kMiglArJdlmeTIeC28p/j
         qZr+S/23aY2lFWB3nZJLyLEGOTQngbIld92spjkkg5D0Bu8WZIPMSgIj1g9xW3JJ0y3B
         iNrPh+n9I/vCngX6NfdLswXNdP/xNsS4ia+EczwVaKONIBEfLmUaP0L5QsN6L4xehz2U
         2f+y8naZ+BcbZ0YnVTHtSpTso/MY1CtapmaZ7rn0y9N7MRUKO4dgwHZRs1CMcF9z+7yY
         fs3A==
X-Forwarded-Encrypted: i=1; AKwUvBxObbgOmR1kouziSlkxc5hdcfhJ3ZOzLkxqmYp/BBKckoqVLP6lAqsuyefO1cBLqwYMZ9FJxkimhu48J3hIROArGQ==@vger.kernel.org
X-Gm-Message-State: AFuF++lHPR0ox8HYYGfln6TVpR8eg+jj67hkVrS2Ax44PoYmmmvnYNTD
	9CxwcA/NZVADCt7dkJgjZ5kpN6wvB7nTzU3tn4V5riBpJBrklfaNzRn1ImxzuziP6XE4lm/i5JU
	7HwfOU/T3J3bcptkci/mLj/whiZl70s/VQELY68aFs9UG7CywVOPZrE/jghqv4khtxRfH5dIk6g
	==
X-Gm-Gg: AYBFou201Clyhwm9iuMc+QFwoycLJYvQgkqT2/Un7KwWI6lLU5/sn9okiCTAc5+dZQ+
	SfWIt9vNIjUj3n/zidoaQLVxq79USGHRbK+lbB0Eto37cxeH5KmqQJeDS66qz5g0pngn/9V3pAa
	zjpinwI220hP/TOk3hdYqBHQHUw4qI7YcAcpI8fITw9K/exFzX25y9uDQ8BczLC8K7EufjoTCyu
	aQR1MXjaDdww8WGcV5UF3xUOc6Q2h11odiH1RgzG+uQp3AFd9stobnFOlDGvuQzzVZ96qzS1ZJg
	yy+3wAIoQklV/3+/2vh9GeOW0X2nKqDCeIWv7aEVoIEYitfGnElfj0Mu4FNYx80TTZOXa4V42Hr
	/ymyt7aUokcPzgbH6CA/+ups6NEx4
X-Received: by 2002:a05:6102:4188:b0:7a7:198b:674b with SMTP id ada2fe7eead31-7ac1e24f078mr2861430137.32.1790176500553;
        Wed, 23 Sep 2026 08:15:00 -0700 (PDT)
X-Received: by 2002:a05:6102:4188:b0:7a7:198b:674b with SMTP id ada2fe7eead31-7ac1e24f078mr2861406137.32.1790176500070;
        Wed, 23 Sep 2026 08:15:00 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:34c6:dbd6:5b58:a3fe])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe0c4054fsm55126325e9.3.2026.09.23.08.14.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 08:14:58 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 17:14:35 +0200
Subject: [PATCH net-next v15 1/9] net: phy: aquantia: fix system interface
 type not updated in forced mode
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-qcom-sa8255p-emac-v15-1-e82f33720737@oss.qualcomm.com>
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
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2050;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=48a0yspdUEk3xwkcjvTbhXXEU17F+t29neQdikkIdcE=;
 b=kA0DAAoBBZ0uy/82hMMByyZiAGqz7OOgV0gtRJkZHGdKpH+X0k8DmAZYc5XdGUyaVggrvqRmy
 IkCMwQAAQoAHRYhBJHlEy3ltUYde6Jl/AWdLsv/NoTDBQJqs+zjAAoJEAWdLsv/NoTDSakQAI45
 3c0nVh4x3AoEXSUEJkG/9yLxn5l3sftmcI8RwXGnLRW7g3FvPfHVO9kgDsV92QuJB8z+HB7Svuf
 BufupGZa5X5CpNX48nD/7QUdcAxHO8pp/F9l7m+W24YDimBlfYxS7IUrHAn55TRybzGJwMaZvJS
 kNOamqPyyzWoCKj0QQiV5TOeYkS1ydw4mUcyMsZY5tDnfUpwE/xFc3RB8ftI9QSKUMPx61J55qq
 2f1vmvyLtyvoVt6WImg9Ii7cBTL3SWVdKumUjIb19euVf3KEJDZOY0g9vSH+nYxpfFJ7jwkM7Bq
 7VequVxgJEIRnfSGF7VPVqefK0pHsTGZ+wms5ctzDQao6OVgGur58IYfJAcebTZnweW0IyIRnj7
 W6vpWiDjXMrvSApv/PAGnGyY2j2Z4zXMYHLInNarwItTlDdAAKCDdI/EAnbNbGDkTja2obpkHru
 XBK8uqCJwXJKsK9VIyy8GQlls0chF7VQmhzqo6T6pco5dR/9F6AqP4a2qOUi11LEgijlqi5OXkQ
 noSRzO1UbVDQuLaUO4HFNbbALAnXh+ADClkQSikfRUvZLJvgAsNUDo4WvXBP0NvHljJHC35xgfI
 wEf/Kh+whGvzFIwbrXorqRhgdglnrJ+Q4wTs3wmd5jXRaNVp22VJRxAbFtbwXebc/xKKUuuMQgR
 SXihp
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA2MCBTYWx0ZWRfXxs+cGzxhOYmq
 p0C50nf/V4CuLshG0xoweQCFJRupBxPxKYhkrWe6+lfYRbDXn7AlBVxLs73ZIYTpwutZ1fTeoyt
 V0Aqz7c9HIKlb8c3b3GCb5jfhRnf22vhvJPJDmHjavLwbrp+cdmwrTRmccd6jtab39ep64ERuu4
 7mQqpXNzJhAqhmVwiAC1uAyG+DePUpf63RgwB4Ma1Pvr5TZ896lwUhTS0jL3QaowA6aLEtMnNvN
 MRvPoq0teNXcINdlCMUYMiZpAbWoVu4NR/O/Az0X6Jw1Pt4MiJppxdSODRufeoWGGsaBXVdvTGu
 UXO10jxEJU2/eRnwmU4aboshCU9vE905ZVIQ81P9yCWzkGbLsG2RGaTlP6Fmi5v539p99EiHz++
 h6W9W9VJDHz0CEYnTPktTeJoB/tV7WHTt1ASuwvgld1uMSX3vWySPW1jExqh6pqg1O3GYd9s1Dz
 9HJ4K5OoXtGq/udK2ow==
X-Proofpoint-GUID: BqG1f1rxuu6Ck-YaDIQTHI2QTu1pArOW
X-Proofpoint-ORIG-GUID: BqG1f1rxuu6Ck-YaDIQTHI2QTu1pArOW
X-Authority-Analysis: v=2.4 cv=K4+3jCWI c=1 sm=1 tr=0 ts=6ab3ecf5 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=mooR1oPkU_hlknJbmfEA:9 a=QEXdDO2ut3YA:10
 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA2MCBTYWx0ZWRfX6yi+ACXecORz
 Ws8sVIIvrB9g0YzyHppdolnatwrKlCWPD34pVj/FJrht61bLqBVu/NrXnlQWRpvmZ0IZQm0Jzlx
 EdD1bg3oXvlxKeRGyjuw2Xh3g3r2M1g=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 suspectscore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230060

aqr_gen1_read_status() decodes the MDIO_PHYXS_VEND_IF_STATUS register
to determine which SerDes interface the PHY is currently using on its
system side and stores the result in phydev->interface. phylink relies
on this value to configure the MAC.

The autoneg == AUTONEG_DISABLE check is not correct:
MDIO_PHYXS_VEND_IF_STATUS is set by the PHY firmware based on the
negotiated link speed, not based on whether autoneg was used to reach
it. When the link comes up at 1G in forced mode, the register correctly
reads SGMII, but the early return prevents phydev->interface from being
updated. It stays at whatever value it held before (typically 2500BASE-X
from the initial autoneg run), so phylink configures the MAC for the
wrong interface and the link cannot come up.

Remove the autoneg guard so that the system interface type is always
decoded when the link is up.

Cc: stable@vger.kernel.org
Fixes: 110a2432c520 ("net: phy: aquantia: add downshift support")
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/net/phy/aquantia/aquantia_main.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/net/phy/aquantia/aquantia_main.c b/drivers/net/phy/aquantia/aquantia_main.c
index e95d391a6dc233879ae1fb2a97758b3df9600ce5..096407bebd52a8e644084c3e286fb5dbcfa3f598 100644
--- a/drivers/net/phy/aquantia/aquantia_main.c
+++ b/drivers/net/phy/aquantia/aquantia_main.c
@@ -544,7 +544,7 @@ static int aqr_gen1_read_status(struct phy_device *phydev)
 	if (ret)
 		return ret;
 
-	if (!phydev->link || phydev->autoneg == AUTONEG_DISABLE)
+	if (!phydev->link)
 		return 0;
 
 	/* The status register is not immediately correct on line side link up.
@@ -594,6 +594,9 @@ static int aqr_gen1_read_status(struct phy_device *phydev)
 
 	phydev->interface = aqr_translate_interface(phydev, interface);
 
+	if (phydev->autoneg == AUTONEG_DISABLE)
+		return 0;
+
 	/* Read rate from vendor register */
 	return aqr_gen1_read_rate(phydev);
 }

-- 
2.47.3

