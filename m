Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB244348C4B
	for <linux-renesas-soc@vger.kernel.org>; Sun, 13 Sep 2026 12:32:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789302729; cv=none; b=B0Pn3HujH0YxXqL96vLz1GQc/kAPa4vIFcdup2Zrl/1OxnnRGjJyY/nKKDDo/OKaYfjpu6O6jvFwKOztg/C0oBa1GyFReiXwb8YXmJwT8mqmzvVhWiyvmAomoxteZ096+ThAozJn6+vQzJ8sno6yGnMWosAv7f3Vkl1vLHvbhos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789302729; c=relaxed/simple;
	bh=W7BM5YgxKisduDLDXl1gcP7v3Zjpi/VabvpbJwvtJEU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ptWKlL7mSzeQMNPkZhjd8q1zN/Z7xs9DaiSxV5KvRCgEFrE56WjpfIvhPTpKGKJCKVTWGJxqAKA4XMiZiamdbq7oyObBknlke4y5UC4F3JMfMCFbF0FTokgNktd6ZBHnVhtyAovBHSjsPOMo8if2/jvmPCEGPPQuT+VPLbUSM/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZLqR96R8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Mx4ugWPn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZLqR96R8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Mx4ugWPn"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68DATvMP2353526
	for <linux-renesas-soc@vger.kernel.org>; Sun, 13 Sep 2026 12:32:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=SZBX33nxuq7ecEGnYetSvL2swA1/EfpXny1
	i5hlb8jI=; b=ZLqR96R8ElbzsftFNR/xOHQ28ZJGwyvbYJNf0xGs7V9dC99t+6+
	1PjLINRztoUrUMOAZyqsth7YzsQ8RSPzHuWfu77UbHsri4g5foM+R404tpjlU+t2
	TmPjNNiSmKaN4AA1DI40sIO6tGTm2X3Ln+MSdgrgHwUPwf0HohcJvb7Eoi9ueVgB
	/vkcuNQQcx+0c9FToArwwvlj28tPMrxGJcobpojpTcaFBMcQVuvDXND3Y9G/q71P
	K3eRuH3R2n8mBsqvmko+ynqqbn0EK8qWExxeNCWkEgzc5AnM5oe39UD7wBkU4ksp
	y/s+Dwje9pwvp4DbGAg9nvqJUmYN9D3T04w==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9cb8rc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Sun, 13 Sep 2026 12:32:04 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5c833d4bd04so836119e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Sun, 13 Sep 2026 05:32:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789302723; x=1789907523; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SZBX33nxuq7ecEGnYetSvL2swA1/EfpXny1i5hlb8jI=;
        b=Mx4ugWPn+OyWLI7Hc9WIriGuX/x3QpceekN6rBYfqkPZXgO/fsLGBITlrwkgZURgjZ
         tMjtvFnZLkzBFABHE6xh1QkPTJLb0F83MmTDgLODynVo/zaLeheCR26Un0ZH8T/Ls78h
         U06R13U/Nl7cPK7akcWx1kIjLJFpMD9XK8G+WGFDDt7q1Ix9CO3vNLahvLnVR8Qqe5wF
         JYz0jvXEjd5tN7khntu5W3Jslcs01bIsBKO7dlI3YL3QIQHrJdAtvkK+N+/OYRllB+W9
         ta9CrFToK2atuUDGfcA0rr64hIXSxAnCxu9OlflvulppLsOF3WacKgvpGEM1D5B+3cuf
         l9BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789302723; x=1789907523;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SZBX33nxuq7ecEGnYetSvL2swA1/EfpXny1i5hlb8jI=;
        b=XB1GGC13jKj9RQk6bhUESzE0Nf9WN+vvV3u07MoUbKeOQyZ+1P3HmBbAOb6Nhnv2yw
         OqMt306oJlDDoLL6dWSztHq80QsrYnC+rdmQbQ44kMc89/FRX7NGErEkhaj5V1oL1uTt
         t+2SI6xAkIMObpaVGr6uvYqF4DP4GwNx9TZ01AsSsLLcOVjZyTviId9d1pp01v+K+4aP
         ltuG+uhursRzTBrfxI+d1db5fwXNWbo1cRt6kZXgHPsfR60AjIYGHz37VHg5agKk2E5J
         Qek9Bexe7GSfO3M4OF/3+8F0Ou4DwsFotdztC03oWXCPR/0sndbz3g65hJwqJcyCKo9T
         xyCg==
X-Forwarded-Encrypted: i=1; AKwUvBwtLn1Yb1+QztDokc/A49Wg6GRhoTqZSstYAK0rGsyE538vpy5LR2Kr8dRwl082vjEPqk8+/R8cU/dO2NTia/I0Ww==@vger.kernel.org
X-Gm-Message-State: AFuF++kdyJsM+LVpB8ekODzuH1dF71SZmfZDptnmqs80OIFkObFL2CrG
	WbJD1eYvXkQIXGGK29X5TMvhJNngAzw+fMJ5kj1m4RLXH4HdMXeU09uA21mXByXD9T0A9mtwK3H
	UO9Uf/lcMQUzOk38XcLC+1bcoUnbdaIMklCqJcI2GhWD2MBDOl6QIN62PY2o+Ifb0xYf3GcwrUQ
	==
X-Gm-Gg: AYBFou2kwV4AsoflFmNA3qXB0ee/PISE5LxIYLH65JvWfExccV1yrqVJDrB7QMUA9jP
	90IPDsl3Co6AdxEzW4lz9oPsP9zSFw/5IxIEn9wWc43vqHdP2CEaVYOekXY0EMMSXXWDRooLn6z
	H7j05Il9hOBJgk32MJqQo2eiPxqFmAA3xhoJ/zB7DtfTpPpF2bjmawy6UE2Ywo2eJbvK5XXTfVr
	K1Jvz0I7PvbTFI1XgnKfd5OkPeCdkcBtkmJ/hDfvkm8R2yxTgQBEj61QDQ0xyNIvk0HEGQYiwiO
	bPANk9BDPuZtv+pwE+Kvp3KJ/+9B5nVe3Xa1hafJ/hL1vRE9BQkvUqvNdsnUuNvzBm4jEw9NeKb
	0tGgoC7ZbeDo7YB4=
X-Received: by 2002:a05:6122:d1e:b0:5bd:71b1:d5c6 with SMTP id 71dfb90a1353d-5c846283ea2mr55294e0c.4.1789302722511;
        Sun, 13 Sep 2026 05:32:02 -0700 (PDT)
X-Received: by 2002:a05:6122:d1e:b0:5bd:71b1:d5c6 with SMTP id 71dfb90a1353d-5c846283ea2mr55138e0c.4.1789302721587;
        Sun, 13 Sep 2026 05:32:01 -0700 (PDT)
Received: from quoll ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb360409sm17866783f8f.36.2026.09.13.05.31.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 05:32:00 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org, linux-mediatek@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] dt-bindings: Use consistent indentation in the example
Date: Sun, 13 Sep 2026 14:31:53 +0200
Message-ID: <20260913123152.99764-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=76194; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=W7BM5YgxKisduDLDXl1gcP7v3Zjpi/VabvpbJwvtJEU=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqppe4Zbq1sLvAxiXZ/yn/7X91vDHk60EjGni73
 cdZ9hbsftyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaqaXuAAKCRDBN2bmhouD
 17cuD/9c6rcgIc7mizf/laz1S5G5CJM8Ve+RFoxHcknb6M5RJUZHxbSfBeqOrDccgwV/VrudJHq
 nSZzTxO5/MUdDa72iUXUfT6dNDfqvCr9eeTR1rztykhFxj2tfeq1dkdhPqgGUaP0NzvvHo6HH2x
 dW4nhyeA/h0OSAsoQUvXJdURB0RPFYiwkc4g2YERJeVKhuyorhgVKNZxSNkYaqT05C2Mne8N7BZ
 mOTcl/IL87M9+SmiRgVd36LeuiLhn1U/0bINC60LRtsHz2c6lLEWlQfEKi5cg/CrleLYnJlNl2Z
 fvxT8gwOy20zNBDaNSQU8lxoeo9sW5C/ZeIrFzYvL4TXYtrUdRooIXy+rFA7OuUIZyoCh2cYEK1
 3R59nWzMYwxVpBPtXM8zjb9YdobYmgBSz/3KDRUxw9UNlI9CZY7Qh5lsqwgk3Gz9nL5shXZj3wZ
 wFJ5oq/fto5JXQ6CfocCDZ1JIdkzf/CvIC6MHynEN6oA1PTl11sNZ9qXB2YhIr57nnvNuJKIumi
 oHLIFt1TxU+IQfHSZF5yII9OneYCc+5/6DQxY67haXK8iR5oHnRPQ6UdIPJ4IFzMhubPzLnachs
 6RanFqWQe+eVjPDzLktpJfrv9vtBleywwwDy6LtGTyQFKv3voud6ULg9xZPTmzLNcg0tmKicZkP 2hgA+RwjA2JF8Jg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEzMDE3OCBTYWx0ZWRfX/CF1wrMMvROY
 xr7KIo7y5ae++WtAGaN3DP01Al1tPzipPv64P2h1KhGAI8gtcFYdtO3dUMrHwZwMy3Lihl0/FfA
 t80X7ermDZnUartPIJ4RUgJFsEW6T5E=
X-Proofpoint-GUID: wSGgPzzrj-qw9xMlJnrUd1wQf4Nw8tKw
X-Authority-Analysis: v=2.4 cv=BdZNQbt2 c=1 sm=1 tr=0 ts=6aa697c4 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=j--UpMyfixqUHk2Gv6QA:9 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-ORIG-GUID: wSGgPzzrj-qw9xMlJnrUd1wQf4Nw8tKw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEzMDE3OCBTYWx0ZWRfXz8rMPA5FtWSl
 WrDBcfiHRtjyv7Dlp1G/eSeH+3PwKYZAM24rRKokg+DFEysc6nJOG/yqEV4nMfTkiSS7MFGVMyq
 No8O4xo2v2Vjo7MpkLR8YnpdKHpoRLNQs4MoCtUdy5a6P9wAUDpJu4BPrrugtd7BO5ZW68VePj1
 SkvO6wUNYzErMjuCXKj68/G/b54CQ962PE6sIB5zWNGdJ9jxEAxGm3006AU3YeDNMp2DPMvAdIF
 8DZv+qLdHdZMeO8KfJCcWYig2U8ymZBmTkaBefldsT8RphUOHzMdobSSnbvXP+e6D+pNetD6NPw
 7Lasf/3Mx6L3v4AGL48/7gVM2DmotWv80b/Tk5NazVApv4uJh8cmbl3s5jM0aApOIwp0cAg2DBt
 s8GysMayCf0e6sgPPFtH8BmdPw1Kfc3lqhTond/an19+ZcVjK1kb39GhOtc+82HXHwg3HzbNDCl
 QEfavnqYGHDU+LJNV1A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-13_04,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 malwarescore=0 clxscore=1015
 spamscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609130178

Correct indentation in the examples to consistent 2- or 4-spaces
indentation to fix dt-check-style warnings ("example 0
[indent-consistent] indent mismatch ...").  Preferred is 4-spaces, but
re-indenting entire example just for that is too much churn.

In two cases - toshiba,tmpv770x-pipllct.yaml and
intel,stratix10-svc.yaml - to fix the warning, drop irrelevant nodes,
not necessary to the example and using different indentation.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../bindings/arm/arm,coresight-cti.yaml       |  44 +++---
 .../bindings/arm/qcom,coresight-tpdm.yaml     |   6 +-
 .../bindings/bus/st,stm32mp25-rifsc.yaml      |  10 +-
 .../bindings/clock/airoha,en7523-scu.yaml     |   4 +-
 .../bindings/clock/imx7ulp-pcc-clock.yaml     |   8 +-
 .../clock/toshiba,tmpv770x-pipllct.yaml       |   7 -
 .../devicetree/bindings/cpu/idle-states.yaml  |  12 +-
 .../bindings/dma/brcm,bcm2835-dma.yaml        |   4 +-
 .../devicetree/bindings/dma/fsl,edma.yaml     |   4 +-
 .../bindings/edac/amazon,al-mc-edac.yaml      |  14 +-
 .../devicetree/bindings/eeprom/at24.yaml      |  18 +--
 .../bindings/extcon/richtek,rt8973a-muic.yaml |   8 +-
 .../extcon/siliconmitus,sm5502-muic.yaml      |   8 +-
 .../firmware/intel,stratix10-svc.yaml         |  27 +---
 .../firmware/xilinx/xlnx,zynqmp-firmware.yaml |   2 +-
 .../devicetree/bindings/gpio/gpio-mmio.yaml   |  36 ++---
 .../devicetree/bindings/gpio/mrvl-gpio.yaml   |   2 +-
 .../bindings/gpio/renesas,rcar-gpio.yaml      |   2 +-
 .../bindings/hwmon/adi,ltc2991.yaml           |  16 +--
 .../bindings/hwmon/lltc,ltc2978.yaml          |   4 +-
 .../marvell,cp110-icu.yaml                    |  20 +--
 .../mailbox/qcom,apcs-kpss-global.yaml        |   6 +-
 .../renesas,rzg3e-xspi.yaml                   |  10 +-
 .../devicetree/bindings/mfd/apple,smc.yaml    |   2 +-
 .../bindings/mfd/delta,tn48m-cpld.yaml        |   4 +-
 .../bindings/mfd/mediatek,mt6360.yaml         |   2 +-
 .../bindings/mfd/mediatek,mt6397.yaml         |   2 +-
 .../bindings/mfd/netronix,ntxec.yaml          |  16 +--
 .../mmc/hisilicon,hi3660-dw-mshc.yaml         |  46 +++---
 .../bindings/mtd/partitions/nvmem-cells.yaml  |  22 +--
 .../tplink,safeloader-partitions.yaml         |   2 +-
 .../bindings/nvmem/airoha,an8855-efuse.yaml   |  16 +--
 .../bindings/nvmem/airoha,smc-efuses.yaml     |   2 +-
 .../bindings/nvmem/sunplus,sp7021-ocotp.yaml  |   8 +-
 .../bindings/pci/mediatek-pcie-gen3.yaml      |   6 +-
 .../bindings/pci/spacemit,k1-pcie-host.yaml   |  18 +--
 .../bindings/pci/xilinx-versal-cpm.yaml       |   6 +-
 .../bindings/phy/brcm,cygnus-pcie-phy.yaml    |   8 +-
 .../bindings/phy/brcm,sata-phy.yaml           |   8 +-
 .../phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml    |  76 +++++-----
 .../bindings/power/supply/bq256xx.yaml        |   2 +-
 .../bindings/power/supply/cw2015_battery.yaml |   8 +-
 .../power/supply/microchip,ucs1002.yaml       |   2 +-
 .../power/supply/sbs,sbs-battery.yaml         |   2 +-
 .../power/supply/sbs,sbs-charger.yaml         |   2 +-
 .../bindings/pwm/nxp,mc33xs2410.yaml          |  44 +++---
 .../bindings/pwm/thead,th1520-pwm.yaml        |  16 +--
 .../bindings/remoteproc/ti,k3-m4f-rproc.yaml  |   2 +-
 .../devicetree/bindings/riscv/cpus.yaml       |  96 ++++++-------
 .../devicetree/bindings/rtc/nxp,pcf85063.yaml |  18 +--
 .../devicetree/bindings/slimbus/slimbus.yaml  |  16 +--
 .../bindings/soc/fsl/cpm_qe/fsl,qe-muram.yaml |   2 +-
 .../bindings/soc/fsl/cpm_qe/fsl,qe.yaml       |  14 +-
 .../soc/imx/fsl,imx8mm-disp-blk-ctrl.yaml     |   8 +-
 .../soc/imx/fsl,imx8mn-disp-blk-ctrl.yaml     |   8 +-
 .../soc/imx/fsl,imx93-media-blk-ctrl.yaml     |   4 +-
 .../soc/mediatek/mediatek,mt8183-dvfsrc.yaml  |  16 +--
 .../bindings/soc/qcom/qcom,rpmh-rsc.yaml      |   2 +-
 .../devicetree/bindings/soc/rockchip/grf.yaml |   2 +-
 .../bindings/soc/ti/k3-ringacc.yaml           |   2 +-
 .../bindings/spi/amlogic,a4-spifc.yaml        |  36 ++---
 .../bindings/spi/marvell,orion-spi.yaml       |  44 +++---
 .../bindings/thermal/brcm,sr-thermal.yaml     | 132 +++++++++---------
 .../bindings/timer/nxp,sysctr-timer.yaml      |   2 +-
 .../watchdog/microchip,pic32mzda-dmt.yaml     |   2 +-
 .../bindings/watchdog/nuvoton,ma35d1-wdt.yaml |   8 +-
 66 files changed, 493 insertions(+), 513 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/arm,coresight-cti.yaml b/Documentation/devicetree/bindings/arm/arm,coresight-cti.yaml
index f4101f94241a..d4fd0e8b2462 100644
--- a/Documentation/devicetree/bindings/arm/arm,coresight-cti.yaml
+++ b/Documentation/devicetree/bindings/arm/arm,coresight-cti.yaml
@@ -288,32 +288,32 @@ examples:
       #size-cells = <0>;
 
       trig-conns@0 {
-            reg = <0>;
-            arm,trig-in-sigs = <4 5 6 7>;
-            arm,trig-in-types = <ETM_EXTOUT
-                                 ETM_EXTOUT
-                                 ETM_EXTOUT
-                                 ETM_EXTOUT>;
-            arm,trig-out-sigs = <4 5 6 7>;
-            arm,trig-out-types = <ETM_EXTIN
-                                  ETM_EXTIN
-                                  ETM_EXTIN
-                                  ETM_EXTIN>;
-            arm,cs-dev-assoc = <&etm0>;
+        reg = <0>;
+        arm,trig-in-sigs = <4 5 6 7>;
+        arm,trig-in-types = <ETM_EXTOUT
+                             ETM_EXTOUT
+                             ETM_EXTOUT
+                             ETM_EXTOUT>;
+        arm,trig-out-sigs = <4 5 6 7>;
+        arm,trig-out-types = <ETM_EXTIN
+                              ETM_EXTIN
+                              ETM_EXTIN
+                              ETM_EXTIN>;
+        arm,cs-dev-assoc = <&etm0>;
       };
 
       trig-conns@1 {
-            reg = <1>;
-            cpu = <&CPU0>;
-            arm,trig-in-sigs = <0 1>;
-            arm,trig-in-types = <PE_DBGTRIGGER
-                                 PE_PMUIRQ>;
-            arm,trig-out-sigs = <0 1 2>;
-            arm,trig-out-types = <PE_EDBGREQ
-                                  PE_DBGRESTART
-                                  PE_CTIIRQ>;
+        reg = <1>;
+        cpu = <&CPU0>;
+        arm,trig-in-sigs = <0 1>;
+        arm,trig-in-types = <PE_DBGTRIGGER
+                             PE_PMUIRQ>;
+        arm,trig-out-sigs = <0 1 2>;
+        arm,trig-out-types = <PE_EDBGREQ
+                              PE_DBGRESTART
+                              PE_CTIIRQ>;
 
-            arm,trig-filters = <0>;
+        arm,trig-filters = <0>;
       };
     };
   # Implementation defined CTI - non CoreSight component connections.
diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-tpdm.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-tpdm.yaml
index c7301f1b28c1..4107eb6517a0 100644
--- a/Documentation/devicetree/bindings/arm/qcom,coresight-tpdm.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom,coresight-tpdm.yaml
@@ -158,9 +158,9 @@ examples:
 
       out-ports {
         port {
-         turing_llm_tpdm_out: endpoint {
-           remote-endpoint = <&turing0_funnel_in1>;
-         };
+          turing_llm_tpdm_out: endpoint {
+            remote-endpoint = <&turing0_funnel_in1>;
+          };
         };
       };
     };
diff --git a/Documentation/devicetree/bindings/bus/st,stm32mp25-rifsc.yaml b/Documentation/devicetree/bindings/bus/st,stm32mp25-rifsc.yaml
index c6280c8c54a3..91de8bb5a368 100644
--- a/Documentation/devicetree/bindings/bus/st,stm32mp25-rifsc.yaml
+++ b/Documentation/devicetree/bindings/bus/st,stm32mp25-rifsc.yaml
@@ -100,10 +100,10 @@ examples:
         ranges;
 
         usart2: serial@400e0000 {
-              compatible = "st,stm32h7-uart";
-              reg = <0x400e0000 0x400>;
-              interrupts = <GIC_SPI 115 IRQ_TYPE_LEVEL_HIGH>;
-              clocks = <&ck_flexgen_08>;
-              access-controllers = <&rifsc 32>;
+            compatible = "st,stm32h7-uart";
+            reg = <0x400e0000 0x400>;
+            interrupts = <GIC_SPI 115 IRQ_TYPE_LEVEL_HIGH>;
+            clocks = <&ck_flexgen_08>;
+            access-controllers = <&rifsc 32>;
         };
     };
diff --git a/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml b/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
index eb24a5687639..30e66c3df918 100644
--- a/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
+++ b/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
@@ -97,8 +97,8 @@ examples:
       scuclk: clock-controller@1fb00000 {
         compatible = "airoha,en7581-scu";
         reg = <0x0 0x1fb00000 0x0 0x970>;
-              #clock-cells = <1>;
-              #reset-cells = <1>;
+        #clock-cells = <1>;
+        #reset-cells = <1>;
       };
     };
 
diff --git a/Documentation/devicetree/bindings/clock/imx7ulp-pcc-clock.yaml b/Documentation/devicetree/bindings/clock/imx7ulp-pcc-clock.yaml
index 76842038f52e..accb536509df 100644
--- a/Documentation/devicetree/bindings/clock/imx7ulp-pcc-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/imx7ulp-pcc-clock.yaml
@@ -103,8 +103,8 @@ examples:
                  <&scg1 IMX7ULP_CLK_FIRC_BUS_CLK>,
                  <&scg1 IMX7ULP_CLK_ROSC>,
                  <&scg1 IMX7ULP_CLK_SPLL_BUS_CLK>;
-         clock-names = "nic1_bus_clk", "nic1_clk", "ddr_clk",
-                       "apll_pfd2", "apll_pfd1", "apll_pfd0",
-                       "upll", "sosc_bus_clk", "firc_bus_clk",
-                       "rosc", "spll_bus_clk";
+        clock-names = "nic1_bus_clk", "nic1_clk", "ddr_clk",
+                      "apll_pfd2", "apll_pfd1", "apll_pfd0",
+                      "upll", "sosc_bus_clk", "firc_bus_clk",
+                      "rosc", "spll_bus_clk";
     };
diff --git a/Documentation/devicetree/bindings/clock/toshiba,tmpv770x-pipllct.yaml b/Documentation/devicetree/bindings/clock/toshiba,tmpv770x-pipllct.yaml
index d36558aa39f3..d9641a99cd9d 100644
--- a/Documentation/devicetree/bindings/clock/toshiba,tmpv770x-pipllct.yaml
+++ b/Documentation/devicetree/bindings/clock/toshiba,tmpv770x-pipllct.yaml
@@ -36,13 +36,6 @@ additionalProperties: false
 
 examples:
   - |
-
-    osc2_clk: osc2-clk {
-      compatible = "fixed-clock";
-      clock-frequency = <20000000>;
-      #clock-cells = <0>;
-    };
-
     soc {
         #address-cells = <2>;
         #size-cells = <2>;
diff --git a/Documentation/devicetree/bindings/cpu/idle-states.yaml b/Documentation/devicetree/bindings/cpu/idle-states.yaml
index 385b0a511652..dbe9aa3183a8 100644
--- a/Documentation/devicetree/bindings/cpu/idle-states.yaml
+++ b/Documentation/devicetree/bindings/cpu/idle-states.yaml
@@ -918,11 +918,11 @@ examples:
 
     // Example 4 - Qualcomm SPC
     idle-states {
-      cpu_spc: cpu-spc {
-        compatible = "qcom,idle-state-spc", "arm,idle-state";
-        entry-latency-us = <150>;
-        exit-latency-us = <200>;
-        min-residency-us = <2000>;
-      };
+        cpu_spc: cpu-spc {
+            compatible = "qcom,idle-state-spc", "arm,idle-state";
+            entry-latency-us = <150>;
+            exit-latency-us = <200>;
+            min-residency-us = <2000>;
+        };
     };
 ...
diff --git a/Documentation/devicetree/bindings/dma/brcm,bcm2835-dma.yaml b/Documentation/devicetree/bindings/dma/brcm,bcm2835-dma.yaml
index c9b9a5490826..e4a57a8fd245 100644
--- a/Documentation/devicetree/bindings/dma/brcm,bcm2835-dma.yaml
+++ b/Documentation/devicetree/bindings/dma/brcm,bcm2835-dma.yaml
@@ -95,8 +95,8 @@ examples:
                         "dma13",
                         "dma14",
                         "dma-shared-all";
-        #dma-cells = <1>;
-        brcm,dma-channel-mask = <0x7f35>;
+      #dma-cells = <1>;
+      brcm,dma-channel-mask = <0x7f35>;
     };
 
 ...
diff --git a/Documentation/devicetree/bindings/dma/fsl,edma.yaml b/Documentation/devicetree/bindings/dma/fsl,edma.yaml
index f609038e35ae..eabb167748b0 100644
--- a/Documentation/devicetree/bindings/dma/fsl,edma.yaml
+++ b/Documentation/devicetree/bindings/dma/fsl,edma.yaml
@@ -321,8 +321,8 @@ examples:
                    <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>,
                    /* last is eDMA2-ERR interrupt */
                    <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>;
-       clock-names = "dma", "dmamux0";
-       clocks = <&pcc2 IMX7ULP_CLK_DMA1>, <&pcc2 IMX7ULP_CLK_DMA_MUX1>;
+      clock-names = "dma", "dmamux0";
+      clocks = <&pcc2 IMX7ULP_CLK_DMA1>, <&pcc2 IMX7ULP_CLK_DMA_MUX1>;
     };
 
   - |
diff --git a/Documentation/devicetree/bindings/edac/amazon,al-mc-edac.yaml b/Documentation/devicetree/bindings/edac/amazon,al-mc-edac.yaml
index 4cfc3a187004..6f3142e42afb 100644
--- a/Documentation/devicetree/bindings/edac/amazon,al-mc-edac.yaml
+++ b/Documentation/devicetree/bindings/edac/amazon,al-mc-edac.yaml
@@ -55,12 +55,12 @@ examples:
         #address-cells = <2>;
         #size-cells = <2>;
         edac@f0080000 {
-          #address-cells = <2>;
-          #size-cells = <2>;
-          compatible = "amazon,al-mc-edac";
-          reg = <0x0 0xf0080000 0x0 0x00010000>;
-          interrupt-parent = <&amazon_al_system_fabric>;
-          interrupt-names = "ue";
-          interrupts = <20 IRQ_TYPE_LEVEL_HIGH>;
+            #address-cells = <2>;
+            #size-cells = <2>;
+            compatible = "amazon,al-mc-edac";
+            reg = <0x0 0xf0080000 0x0 0x00010000>;
+            interrupt-parent = <&amazon_al_system_fabric>;
+            interrupt-names = "ue";
+            interrupts = <20 IRQ_TYPE_LEVEL_HIGH>;
         };
     };
diff --git a/Documentation/devicetree/bindings/eeprom/at24.yaml b/Documentation/devicetree/bindings/eeprom/at24.yaml
index ef88f46928a4..e937d0829134 100644
--- a/Documentation/devicetree/bindings/eeprom/at24.yaml
+++ b/Documentation/devicetree/bindings/eeprom/at24.yaml
@@ -222,15 +222,15 @@ unevaluatedProperties: false
 examples:
   - |
     i2c {
-      #address-cells = <1>;
-      #size-cells = <0>;
+        #address-cells = <1>;
+        #size-cells = <0>;
 
-      eeprom@52 {
-          compatible = "microchip,24c32", "atmel,24c32";
-          reg = <0x52>;
-          pagesize = <32>;
-          wp-gpios = <&gpio1 3 0>;
-          num-addresses = <8>;
-      };
+        eeprom@52 {
+            compatible = "microchip,24c32", "atmel,24c32";
+            reg = <0x52>;
+            pagesize = <32>;
+            wp-gpios = <&gpio1 3 0>;
+            num-addresses = <8>;
+        };
     };
 ...
diff --git a/Documentation/devicetree/bindings/extcon/richtek,rt8973a-muic.yaml b/Documentation/devicetree/bindings/extcon/richtek,rt8973a-muic.yaml
index f9e0d816c025..62f1b22c0f69 100644
--- a/Documentation/devicetree/bindings/extcon/richtek,rt8973a-muic.yaml
+++ b/Documentation/devicetree/bindings/extcon/richtek,rt8973a-muic.yaml
@@ -41,9 +41,9 @@ examples:
         #address-cells = <1>;
         #size-cells = <0>;
         usb-switch@14 {
-          compatible = "richtek,rt8973a-muic";
-          reg = <0x14>;
-          interrupt-parent = <&gpio>;
-          interrupts = <1 IRQ_TYPE_EDGE_FALLING>;
+            compatible = "richtek,rt8973a-muic";
+            reg = <0x14>;
+            interrupt-parent = <&gpio>;
+            interrupts = <1 IRQ_TYPE_EDGE_FALLING>;
         };
     };
diff --git a/Documentation/devicetree/bindings/extcon/siliconmitus,sm5502-muic.yaml b/Documentation/devicetree/bindings/extcon/siliconmitus,sm5502-muic.yaml
index 7ef2d9bef72d..16721d3d4b37 100644
--- a/Documentation/devicetree/bindings/extcon/siliconmitus,sm5502-muic.yaml
+++ b/Documentation/devicetree/bindings/extcon/siliconmitus,sm5502-muic.yaml
@@ -49,9 +49,9 @@ examples:
         #size-cells = <0>;
 
         extcon@25 {
-                compatible = "siliconmitus,sm5502-muic";
-                reg = <0x25>;
-                interrupt-parent = <&msmgpio>;
-                interrupts = <12 IRQ_TYPE_EDGE_FALLING>;
+            compatible = "siliconmitus,sm5502-muic";
+            reg = <0x25>;
+            interrupt-parent = <&msmgpio>;
+            interrupts = <12 IRQ_TYPE_EDGE_FALLING>;
         };
     };
diff --git a/Documentation/devicetree/bindings/firmware/intel,stratix10-svc.yaml b/Documentation/devicetree/bindings/firmware/intel,stratix10-svc.yaml
index b42cfa78b28b..765ff770245d 100644
--- a/Documentation/devicetree/bindings/firmware/intel,stratix10-svc.yaml
+++ b/Documentation/devicetree/bindings/firmware/intel,stratix10-svc.yaml
@@ -82,27 +82,14 @@ additionalProperties: false
 
 examples:
   - |
-    reserved-memory {
-      #address-cells = <2>;
-      #size-cells = <2>;
-
-      service_reserved: svcbuffer@0 {
-              compatible = "shared-dma-pool";
-              reg = <0x0 0x0 0x0 0x1000000>;
-              alignment = <0x1000>;
-              no-map;
-      };
-    };
-
     firmware {
-      svc {
-        compatible = "intel,stratix10-svc";
-        method = "smc";
-        memory-region = <&service_reserved>;
+        svc {
+            compatible = "intel,stratix10-svc";
+            method = "smc";
+            memory-region = <&service_reserved>;
 
-        fpga-mgr {
-          compatible = "intel,stratix10-soc-fpga-mgr";
+            fpga-mgr {
+                compatible = "intel,stratix10-soc-fpga-mgr";
+            };
         };
-      };
     };
-
diff --git a/Documentation/devicetree/bindings/firmware/xilinx/xlnx,zynqmp-firmware.yaml b/Documentation/devicetree/bindings/firmware/xilinx/xlnx,zynqmp-firmware.yaml
index 72af37cdb103..6d9a024f1c77 100644
--- a/Documentation/devicetree/bindings/firmware/xilinx/xlnx,zynqmp-firmware.yaml
+++ b/Documentation/devicetree/bindings/firmware/xilinx/xlnx,zynqmp-firmware.yaml
@@ -151,7 +151,7 @@ examples:
             #size-cells = <1>;
 
             soc_revision: soc-revision@0 {
-                reg = <0x0 0x4>;
+              reg = <0x0 0x4>;
             };
           };
         };
diff --git a/Documentation/devicetree/bindings/gpio/gpio-mmio.yaml b/Documentation/devicetree/bindings/gpio/gpio-mmio.yaml
index 1b2d253b19c1..918499636488 100644
--- a/Documentation/devicetree/bindings/gpio/gpio-mmio.yaml
+++ b/Documentation/devicetree/bindings/gpio/gpio-mmio.yaml
@@ -117,30 +117,30 @@ unevaluatedProperties: false
 examples:
   - |
     gpio@1f300010 {
-      compatible = "ni,169445-nand-gpio";
-      reg = <0x1f300010 0x4>;
-      reg-names = "dat";
-      gpio-controller;
-      #gpio-cells = <2>;
+        compatible = "ni,169445-nand-gpio";
+        reg = <0x1f300010 0x4>;
+        reg-names = "dat";
+        gpio-controller;
+        #gpio-cells = <2>;
     };
 
     gpio@e0100000 {
-      compatible = "wd,mbl-gpio";
-      reg-names = "dat";
-      reg = <0xe0100000 0x1>;
-      #gpio-cells = <2>;
-      gpio-controller;
-      no-output;
+        compatible = "wd,mbl-gpio";
+        reg-names = "dat";
+        reg = <0xe0100000 0x1>;
+        #gpio-cells = <2>;
+        gpio-controller;
+        no-output;
     };
 
     gpio@fffe0406 {
-      compatible = "brcm,bcm6345-gpio";
-      reg-names = "dirout", "dat";
-      reg = <0xfffe0406 2>, <0xfffe040a 2>;
-      ngpios = <15>;
-      native-endian;
-      gpio-controller;
-      #gpio-cells = <2>;
+        compatible = "brcm,bcm6345-gpio";
+        reg-names = "dirout", "dat";
+        reg = <0xfffe0406 2>, <0xfffe040a 2>;
+        ngpios = <15>;
+        native-endian;
+        gpio-controller;
+        #gpio-cells = <2>;
     };
 
     bus@c4000000 {
diff --git a/Documentation/devicetree/bindings/gpio/mrvl-gpio.yaml b/Documentation/devicetree/bindings/gpio/mrvl-gpio.yaml
index 7f420b9c0480..05c78b5952a8 100644
--- a/Documentation/devicetree/bindings/gpio/mrvl-gpio.yaml
+++ b/Documentation/devicetree/bindings/gpio/mrvl-gpio.yaml
@@ -167,6 +167,6 @@ examples:
         gpio@d4019100 {
             reg = <0xd4019100 0x4>;
         };
-     };
+    };
 
 ...
diff --git a/Documentation/devicetree/bindings/gpio/renesas,rcar-gpio.yaml b/Documentation/devicetree/bindings/gpio/renesas,rcar-gpio.yaml
index d32e103a64aa..fed82aa7c1b8 100644
--- a/Documentation/devicetree/bindings/gpio/renesas,rcar-gpio.yaml
+++ b/Documentation/devicetree/bindings/gpio/renesas,rcar-gpio.yaml
@@ -150,4 +150,4 @@ examples:
         gpio-reserved-ranges = <17 10>;
         interrupt-controller;
         #interrupt-cells = <2>;
-     };
+    };
diff --git a/Documentation/devicetree/bindings/hwmon/adi,ltc2991.yaml b/Documentation/devicetree/bindings/hwmon/adi,ltc2991.yaml
index 2210764a81bb..78d0ed692ec5 100644
--- a/Documentation/devicetree/bindings/hwmon/adi,ltc2991.yaml
+++ b/Documentation/devicetree/bindings/hwmon/adi,ltc2991.yaml
@@ -104,23 +104,23 @@ examples:
             vcc-supply = <&vcc>;
 
             channel@0 {
-                    reg = <0x0>;
-                    shunt-resistor-micro-ohms = <100000>;
+                reg = <0x0>;
+                shunt-resistor-micro-ohms = <100000>;
             };
 
             channel@1 {
-                    reg = <0x1>;
-                    shunt-resistor-micro-ohms = <100000>;
+                reg = <0x1>;
+                shunt-resistor-micro-ohms = <100000>;
             };
 
             channel@2 {
-                    reg = <0x2>;
-                    adi,temperature-enable;
+                reg = <0x2>;
+                adi,temperature-enable;
             };
 
             channel@3 {
-                    reg = <0x3>;
-                    adi,temperature-enable;
+                reg = <0x3>;
+                adi,temperature-enable;
             };
         };
     };
diff --git a/Documentation/devicetree/bindings/hwmon/lltc,ltc2978.yaml b/Documentation/devicetree/bindings/hwmon/lltc,ltc2978.yaml
index ea8b1553a3e9..ae042275fc7a 100644
--- a/Documentation/devicetree/bindings/hwmon/lltc,ltc2978.yaml
+++ b/Documentation/devicetree/bindings/hwmon/lltc,ltc2978.yaml
@@ -92,10 +92,10 @@ examples:
 
             regulators {
                 vout0 {
-                     regulator-name = "FPGA-2.5V";
+                    regulator-name = "FPGA-2.5V";
                 };
                 vout2 {
-                     regulator-name = "FPGA-1.5V";
+                    regulator-name = "FPGA-1.5V";
                 };
             };
         };
diff --git a/Documentation/devicetree/bindings/interrupt-controller/marvell,cp110-icu.yaml b/Documentation/devicetree/bindings/interrupt-controller/marvell,cp110-icu.yaml
index ddfce217e119..264c36d37037 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/marvell,cp110-icu.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/marvell,cp110-icu.yaml
@@ -84,18 +84,18 @@ examples:
         ranges;
 
         interrupt-controller@10 {
-                compatible = "marvell,cp110-icu-nsr";
-                reg = <0x10 0x20>;
-                #interrupt-cells = <2>;
-                interrupt-controller;
-                msi-parent = <&gicp>;
+            compatible = "marvell,cp110-icu-nsr";
+            reg = <0x10 0x20>;
+            #interrupt-cells = <2>;
+            interrupt-controller;
+            msi-parent = <&gicp>;
         };
 
         interrupt-controller@50 {
-                compatible = "marvell,cp110-icu-sei";
-                reg = <0x50 0x10>;
-                #interrupt-cells = <2>;
-                interrupt-controller;
-                msi-parent = <&sei>;
+            compatible = "marvell,cp110-icu-sei";
+            reg = <0x50 0x10>;
+            #interrupt-cells = <2>;
+            interrupt-controller;
+            msi-parent = <&sei>;
         };
     };
diff --git a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
index 39bc374300c3..496729c53f64 100644
--- a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
+++ b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
@@ -272,9 +272,9 @@ examples:
         #mbox-cells = <1>;
 
         apcs_clk: clock-controller {
-          clocks = <&apcs_hfpll>, <&gcc GCC_GPLL0_AO_OUT_MAIN>;
-          clock-names = "pll", "aux";
-          #clock-cells = <0>;
+            clocks = <&apcs_hfpll>, <&gcc GCC_GPLL0_AO_OUT_MAIN>;
+            clock-names = "pll", "aux";
+            #clock-cells = <0>;
         };
     };
 
diff --git a/Documentation/devicetree/bindings/memory-controllers/renesas,rzg3e-xspi.yaml b/Documentation/devicetree/bindings/memory-controllers/renesas,rzg3e-xspi.yaml
index cdeca4c795f3..8b3ab8ee15f4 100644
--- a/Documentation/devicetree/bindings/memory-controllers/renesas,rzg3e-xspi.yaml
+++ b/Documentation/devicetree/bindings/memory-controllers/renesas,rzg3e-xspi.yaml
@@ -173,10 +173,10 @@ examples:
         #size-cells = <0>;
 
         flash@0 {
-          compatible = "jedec,spi-nor";
-          reg = <0>;
-          spi-max-frequency = <40000000>;
-          spi-tx-bus-width = <1>;
-          spi-rx-bus-width = <1>;
+            compatible = "jedec,spi-nor";
+            reg = <0>;
+            spi-max-frequency = <40000000>;
+            spi-tx-bus-width = <1>;
+            spi-rx-bus-width = <1>;
         };
     };
diff --git a/Documentation/devicetree/bindings/mfd/apple,smc.yaml b/Documentation/devicetree/bindings/mfd/apple,smc.yaml
index 34ce048619f5..9320c0eb1351 100644
--- a/Documentation/devicetree/bindings/mfd/apple,smc.yaml
+++ b/Documentation/devicetree/bindings/mfd/apple,smc.yaml
@@ -91,7 +91,7 @@ examples:
           compatible = "apple,smc-rtc";
           nvmem-cells = <&rtc_offset>;
           nvmem-cell-names = "rtc_offset";
-       };
+        };
 
         hwmon {
           compatible = "apple,smc-hwmon";
diff --git a/Documentation/devicetree/bindings/mfd/delta,tn48m-cpld.yaml b/Documentation/devicetree/bindings/mfd/delta,tn48m-cpld.yaml
index d3b79140cce2..f7bf29d9cd14 100644
--- a/Documentation/devicetree/bindings/mfd/delta,tn48m-cpld.yaml
+++ b/Documentation/devicetree/bindings/mfd/delta,tn48m-cpld.yaml
@@ -83,8 +83,8 @@ examples:
             };
 
             reset-controller {
-              compatible = "delta,tn48m-reset";
-              #reset-cells = <1>;
+                compatible = "delta,tn48m-reset";
+                #reset-cells = <1>;
             };
         };
     };
diff --git a/Documentation/devicetree/bindings/mfd/mediatek,mt6360.yaml b/Documentation/devicetree/bindings/mfd/mediatek,mt6360.yaml
index fb65abf30d57..71c3f3ce75c2 100644
--- a/Documentation/devicetree/bindings/mfd/mediatek,mt6360.yaml
+++ b/Documentation/devicetree/bindings/mfd/mediatek,mt6360.yaml
@@ -232,7 +232,7 @@ examples:
                             reg = <1>;
                             endpoint {
                                 remote-endpoint = <&usb_ss>;
-                          };
+                            };
                         };
                         port@2 {
                             reg = <2>;
diff --git a/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml b/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
index 3cbc0dc12c31..16c0e9e2463f 100644
--- a/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
+++ b/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
@@ -516,7 +516,7 @@ examples:
                 regulator-boot-on;
             };
 
-           ldo_vcamd {
+            ldo_vcamd {
                 regulator-name = "vcamd";
                 regulator-min-microvolt = <1200000>;
                 regulator-max-microvolt = <1800000>;
diff --git a/Documentation/devicetree/bindings/mfd/netronix,ntxec.yaml b/Documentation/devicetree/bindings/mfd/netronix,ntxec.yaml
index 37fbb953ea12..17b07225e583 100644
--- a/Documentation/devicetree/bindings/mfd/netronix,ntxec.yaml
+++ b/Documentation/devicetree/bindings/mfd/netronix,ntxec.yaml
@@ -52,14 +52,14 @@ examples:
         #size-cells = <0>;
 
         ec: embedded-controller@43 {
-                pinctrl-names = "default";
-                pinctrl-0 = <&pinctrl_ntxec>;
+            pinctrl-names = "default";
+            pinctrl-0 = <&pinctrl_ntxec>;
 
-                compatible = "netronix,ntxec";
-                reg = <0x43>;
-                system-power-controller;
-                interrupt-parent = <&gpio4>;
-                interrupts = <11 IRQ_TYPE_EDGE_FALLING>;
-                #pwm-cells = <2>;
+            compatible = "netronix,ntxec";
+            reg = <0x43>;
+            system-power-controller;
+            interrupt-parent = <&gpio4>;
+            interrupts = <11 IRQ_TYPE_EDGE_FALLING>;
+            #pwm-cells = <2>;
         };
     };
diff --git a/Documentation/devicetree/bindings/mmc/hisilicon,hi3660-dw-mshc.yaml b/Documentation/devicetree/bindings/mmc/hisilicon,hi3660-dw-mshc.yaml
index 296bd776488e..01cd31f735ca 100644
--- a/Documentation/devicetree/bindings/mmc/hisilicon,hi3660-dw-mshc.yaml
+++ b/Documentation/devicetree/bindings/mmc/hisilicon,hi3660-dw-mshc.yaml
@@ -90,28 +90,28 @@ examples:
     #include <dt-bindings/interrupt-controller/arm-gic.h>
 
     soc {
-      #address-cells = <2>;
-      #size-cells = <2>;
+        #address-cells = <2>;
+        #size-cells = <2>;
 
-      mmc@f723e000 {
-          compatible = "hisilicon,hi6220-dw-mshc";
-          reg = <0x0 0xf723e000 0x0 0x1000>;
-          interrupts = <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>;
-          clocks = <&clock_sys HI6220_MMC1_CIUCLK>,
-                   <&clock_sys HI6220_MMC1_CLK>;
-          clock-names = "ciu", "biu";
-          bus-width = <4>;
-          disable-wp;
-          cap-sd-highspeed;
-          sd-uhs-sdr12;
-          sd-uhs-sdr25;
-          card-detect-delay = <200>;
-          hisilicon,peripheral-syscon = <&ao_ctrl>;
-          cd-gpios = <&gpio1 0 GPIO_ACTIVE_LOW>;
-          pinctrl-names = "default", "idle";
-          pinctrl-0 = <&sd_pmx_func &sd_clk_cfg_func &sd_cfg_func>;
-          pinctrl-1 = <&sd_pmx_idle &sd_clk_cfg_idle &sd_cfg_idle>;
-          vqmmc-supply = <&ldo7>;
-          vmmc-supply = <&ldo10>;
-      };
+        mmc@f723e000 {
+            compatible = "hisilicon,hi6220-dw-mshc";
+            reg = <0x0 0xf723e000 0x0 0x1000>;
+            interrupts = <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>;
+            clocks = <&clock_sys HI6220_MMC1_CIUCLK>,
+                     <&clock_sys HI6220_MMC1_CLK>;
+            clock-names = "ciu", "biu";
+            bus-width = <4>;
+            disable-wp;
+            cap-sd-highspeed;
+            sd-uhs-sdr12;
+            sd-uhs-sdr25;
+            card-detect-delay = <200>;
+            hisilicon,peripheral-syscon = <&ao_ctrl>;
+            cd-gpios = <&gpio1 0 GPIO_ACTIVE_LOW>;
+            pinctrl-names = "default", "idle";
+            pinctrl-0 = <&sd_pmx_func &sd_clk_cfg_func &sd_cfg_func>;
+            pinctrl-1 = <&sd_pmx_idle &sd_clk_cfg_idle &sd_cfg_idle>;
+            vqmmc-supply = <&ldo7>;
+            vmmc-supply = <&ldo10>;
+        };
     };
diff --git a/Documentation/devicetree/bindings/mtd/partitions/nvmem-cells.yaml b/Documentation/devicetree/bindings/mtd/partitions/nvmem-cells.yaml
index 9518281007af..7d5d3ce25bd4 100644
--- a/Documentation/devicetree/bindings/mtd/partitions/nvmem-cells.yaml
+++ b/Documentation/devicetree/bindings/mtd/partitions/nvmem-cells.yaml
@@ -33,14 +33,14 @@ unevaluatedProperties: false
 examples:
   - |
     partitions {
-      compatible = "fixed-partitions";
-      #address-cells = <1>;
-      #size-cells = <1>;
+        compatible = "fixed-partitions";
+        #address-cells = <1>;
+        #size-cells = <1>;
 
-      /* ... */
+        /* ... */
 
-      };
-      art: art@1200000 {
+    };
+    art: art@1200000 {
         compatible = "nvmem-cells";
         reg = <0x1200000 0x0140000>;
         label = "art";
@@ -49,21 +49,21 @@ examples:
         #size-cells = <1>;
 
         macaddr_gmac1: macaddr_gmac1@0 {
-          reg = <0x0 0x6>;
+            reg = <0x0 0x6>;
         };
 
         macaddr_gmac2: macaddr_gmac2@6 {
-          reg = <0x6 0x6>;
+            reg = <0x6 0x6>;
         };
 
         pre_cal_24g: pre_cal_24g@1000 {
-          reg = <0x1000 0x2f20>;
+            reg = <0x1000 0x2f20>;
         };
 
         pre_cal_5g: pre_cal_5g@5000{
-          reg = <0x5000 0x2f20>;
+            reg = <0x5000 0x2f20>;
         };
-      };
+    };
   - |
     partitions {
         compatible = "fixed-partitions";
diff --git a/Documentation/devicetree/bindings/mtd/partitions/tplink,safeloader-partitions.yaml b/Documentation/devicetree/bindings/mtd/partitions/tplink,safeloader-partitions.yaml
index 40e6eaab03ce..24e026522d0a 100644
--- a/Documentation/devicetree/bindings/mtd/partitions/tplink,safeloader-partitions.yaml
+++ b/Documentation/devicetree/bindings/mtd/partitions/tplink,safeloader-partitions.yaml
@@ -52,6 +52,6 @@ examples:
         partitions-table-offset = <0x100000>;
 
         partition-file-system {
-                linux,rootfs;
+            linux,rootfs;
         };
     };
diff --git a/Documentation/devicetree/bindings/nvmem/airoha,an8855-efuse.yaml b/Documentation/devicetree/bindings/nvmem/airoha,an8855-efuse.yaml
index 9802d9ea2176..673ad5cead74 100644
--- a/Documentation/devicetree/bindings/nvmem/airoha,an8855-efuse.yaml
+++ b/Documentation/devicetree/bindings/nvmem/airoha,an8855-efuse.yaml
@@ -41,7 +41,7 @@ examples:
             #size-cells = <1>;
 
             shift_sel_port0_tx_a: shift-sel-port0-tx-a@c {
-               reg = <0xc 0x4>;
+                reg = <0xc 0x4>;
             };
 
             shift_sel_port0_tx_b: shift-sel-port0-tx-b@10 {
@@ -53,23 +53,23 @@ examples:
             };
 
             shift_sel_port0_tx_d: shift-sel-port0-tx-d@18 {
-               reg = <0x18 0x4>;
+                reg = <0x18 0x4>;
             };
 
             shift_sel_port1_tx_a: shift-sel-port1-tx-a@1c {
-               reg = <0x1c 0x4>;
+                reg = <0x1c 0x4>;
             };
 
             shift_sel_port1_tx_b: shift-sel-port1-tx-b@20 {
-               reg = <0x20 0x4>;
+                reg = <0x20 0x4>;
             };
 
             shift_sel_port1_tx_c: shift-sel-port1-tx-c@24 {
-               reg = <0x24 0x4>;
+                reg = <0x24 0x4>;
             };
 
             shift_sel_port1_tx_d: shift-sel-port1-tx-d@28 {
-               reg = <0x28 0x4>;
+                reg = <0x28 0x4>;
             };
 
             shift_sel_port2_tx_a: shift-sel-port2-tx-a@2c {
@@ -97,11 +97,11 @@ examples:
             };
 
             shift_sel_port3_tx_c: shift-sel-port3-tx-c@54 {
-               reg = <0x54 0x4>;
+                reg = <0x54 0x4>;
             };
 
             shift_sel_port3_tx_d: shift-sel-port3-tx-d@58 {
-               reg = <0x58 0x4>;
+                reg = <0x58 0x4>;
             };
 
             shift_sel_port4_tx_a: shift-sel-port4-tx-a@5c {
diff --git a/Documentation/devicetree/bindings/nvmem/airoha,smc-efuses.yaml b/Documentation/devicetree/bindings/nvmem/airoha,smc-efuses.yaml
index c52f8d4bec39..3b61fe068206 100644
--- a/Documentation/devicetree/bindings/nvmem/airoha,smc-efuses.yaml
+++ b/Documentation/devicetree/bindings/nvmem/airoha,smc-efuses.yaml
@@ -60,7 +60,7 @@ examples:
         #size-cells = <0>;
 
         efuse-bank@0 {
-           reg = <0>;
+            reg = <0>;
         };
     };
 
diff --git a/Documentation/devicetree/bindings/nvmem/sunplus,sp7021-ocotp.yaml b/Documentation/devicetree/bindings/nvmem/sunplus,sp7021-ocotp.yaml
index af97eeb8316c..0a0209e63365 100644
--- a/Documentation/devicetree/bindings/nvmem/sunplus,sp7021-ocotp.yaml
+++ b/Documentation/devicetree/bindings/nvmem/sunplus,sp7021-ocotp.yaml
@@ -64,16 +64,16 @@ examples:
         #address-cells = <1>;
         #size-cells = <1>;
         therm_calib: thermal-calibration@14 {
-          reg = <0x14 0x3>;
+            reg = <0x14 0x3>;
         };
         disc_vol: disconnect-voltage@18 {
-          reg = <0x18 0x2>;
+            reg = <0x18 0x2>;
         };
         mac_addr0: mac-address0@34 {
-          reg = <0x34 0x6>;
+            reg = <0x34 0x6>;
         };
         mac_addr1: mac-address1@3a {
-          reg = <0x3a 0x6>;
+            reg = <0x3a 0x6>;
         };
     };
 ...
diff --git a/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml b/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
index b88717dec1fa..47cdf076f8a7 100644
--- a/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
+++ b/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
@@ -352,9 +352,9 @@ examples:
                             <0 0 0 3 &pcie_intc 2>,
                             <0 0 0 4 &pcie_intc 3>;
             pcie_intc: interrupt-controller {
-                      #address-cells = <0>;
-                      #interrupt-cells = <1>;
-                      interrupt-controller;
+                #address-cells = <0>;
+                #interrupt-cells = <1>;
+                interrupt-controller;
             };
         };
     };
diff --git a/Documentation/devicetree/bindings/pci/spacemit,k1-pcie-host.yaml b/Documentation/devicetree/bindings/pci/spacemit,k1-pcie-host.yaml
index c4c00b5fcdc0..4085cdc8cf2d 100644
--- a/Documentation/devicetree/bindings/pci/spacemit,k1-pcie-host.yaml
+++ b/Documentation/devicetree/bindings/pci/spacemit,k1-pcie-host.yaml
@@ -144,14 +144,14 @@ examples:
         spacemit,apmu = <&syscon_apmu 0x3d4>;
 
         pcie@0 {
-          device_type = "pci";
-          compatible = "pciclass,0604";
-          reg = <0x0 0x0 0x0 0x0 0x0>;
-          bus-range = <0x01 0xff>;
-          #address-cells = <3>;
-          #size-cells = <2>;
-          ranges;
-          phys = <&pcie1_phy>;
-          vpcie3v3-supply = <&pcie_vcc_3v3>;
+            device_type = "pci";
+            compatible = "pciclass,0604";
+            reg = <0x0 0x0 0x0 0x0 0x0>;
+            bus-range = <0x01 0xff>;
+            #address-cells = <3>;
+            #size-cells = <2>;
+            ranges;
+            phys = <&pcie1_phy>;
+            vpcie3v3-supply = <&pcie_vcc_3v3>;
         };
     };
diff --git a/Documentation/devicetree/bindings/pci/xilinx-versal-cpm.yaml b/Documentation/devicetree/bindings/pci/xilinx-versal-cpm.yaml
index 9823456addea..c136f647c15a 100644
--- a/Documentation/devicetree/bindings/pci/xilinx-versal-cpm.yaml
+++ b/Documentation/devicetree/bindings/pci/xilinx-versal-cpm.yaml
@@ -100,9 +100,9 @@ examples:
                   <0x6 0x00000000 0x0 0x10000000>;
             reg-names = "cpm_slcr", "cfg";
             pcie_intc_0: interrupt-controller {
-                    #address-cells = <0>;
-                    #interrupt-cells = <1>;
-                    interrupt-controller;
+                #address-cells = <0>;
+                #interrupt-cells = <1>;
+                interrupt-controller;
             };
         };
 
diff --git a/Documentation/devicetree/bindings/phy/brcm,cygnus-pcie-phy.yaml b/Documentation/devicetree/bindings/phy/brcm,cygnus-pcie-phy.yaml
index 808e90b2465d..b602bb3fd1b1 100644
--- a/Documentation/devicetree/bindings/phy/brcm,cygnus-pcie-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/brcm,cygnus-pcie-phy.yaml
@@ -66,12 +66,12 @@ examples:
       #size-cells = <0>;
 
       pcie0_phy: pcie-phy@0 {
-          reg = <0>;
-          #phy-cells = <0>;
+        reg = <0>;
+        #phy-cells = <0>;
       };
 
       pcie1_phy: pcie-phy@1 {
-          reg = <1>;
-          #phy-cells = <0>;
+        reg = <1>;
+        #phy-cells = <0>;
       };
     };
diff --git a/Documentation/devicetree/bindings/phy/brcm,sata-phy.yaml b/Documentation/devicetree/bindings/phy/brcm,sata-phy.yaml
index 439bda142764..f15cf9082a53 100644
--- a/Documentation/devicetree/bindings/phy/brcm,sata-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/brcm,sata-phy.yaml
@@ -133,12 +133,12 @@ examples:
         #size-cells = <0>;
 
         sata-phy@0 {
-                reg = <0>;
-                #phy-cells = <0>;
+            reg = <0>;
+            #phy-cells = <0>;
         };
 
         sata-phy@1 {
-                reg = <1>;
-                #phy-cells = <0>;
+            reg = <1>;
+            #phy-cells = <0>;
         };
     };
diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
index 8adfc78108fe..23905449e08d 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
@@ -245,55 +245,55 @@ examples:
     #include <dt-bindings/clock/qcom,gcc-sc8280xp.h>
 
     phy@88eb000 {
-      compatible = "qcom,sc8280xp-qmp-usb43dp-phy";
-      reg = <0x088eb000 0x4000>;
+        compatible = "qcom,sc8280xp-qmp-usb43dp-phy";
+        reg = <0x088eb000 0x4000>;
 
-      clocks = <&gcc GCC_USB3_PRIM_PHY_AUX_CLK>,
-               <&gcc GCC_USB4_EUD_CLKREF_CLK>,
-               <&gcc GCC_USB3_PRIM_PHY_COM_AUX_CLK>,
-               <&gcc GCC_USB3_PRIM_PHY_PIPE_CLK>;
-      clock-names = "aux", "ref", "com_aux", "usb3_pipe";
+        clocks = <&gcc GCC_USB3_PRIM_PHY_AUX_CLK>,
+                 <&gcc GCC_USB4_EUD_CLKREF_CLK>,
+                 <&gcc GCC_USB3_PRIM_PHY_COM_AUX_CLK>,
+                 <&gcc GCC_USB3_PRIM_PHY_PIPE_CLK>;
+        clock-names = "aux", "ref", "com_aux", "usb3_pipe";
 
-      power-domains = <&gcc USB30_PRIM_GDSC>;
+        power-domains = <&gcc USB30_PRIM_GDSC>;
 
-      resets = <&gcc GCC_USB3_PHY_PRIM_BCR>,
-               <&gcc GCC_USB4_DP_PHY_PRIM_BCR>;
-      reset-names = "phy", "common";
+        resets = <&gcc GCC_USB3_PHY_PRIM_BCR>,
+                 <&gcc GCC_USB4_DP_PHY_PRIM_BCR>;
+        reset-names = "phy", "common";
 
-      vdda-phy-supply = <&vreg_l9d>;
-      vdda-pll-supply = <&vreg_l4d>;
+        vdda-phy-supply = <&vreg_l9d>;
+        vdda-pll-supply = <&vreg_l4d>;
 
-      orientation-switch;
+        orientation-switch;
 
-      #clock-cells = <1>;
-      #phy-cells = <1>;
+        #clock-cells = <1>;
+        #phy-cells = <1>;
 
-      ports {
-          #address-cells = <1>;
-          #size-cells = <0>;
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
 
-          port@0 {
-              reg = <0>;
+            port@0 {
+                reg = <0>;
 
-              endpoint {
-                  remote-endpoint = <&typec_connector_ss>;
-              };
-          };
+                endpoint {
+                    remote-endpoint = <&typec_connector_ss>;
+                };
+            };
 
-          port@1 {
-              reg = <1>;
+            port@1 {
+                reg = <1>;
 
-              endpoint {
-                  remote-endpoint = <&dwc3_ss_out>;
-              };
-          };
+                endpoint {
+                    remote-endpoint = <&dwc3_ss_out>;
+                };
+            };
 
-          port@2 {
-              reg = <2>;
+            port@2 {
+                reg = <2>;
 
-              endpoint {
-                  remote-endpoint = <&mdss_dp_out>;
-              };
-          };
-      };
+                endpoint {
+                    remote-endpoint = <&mdss_dp_out>;
+                };
+            };
+        };
     };
diff --git a/Documentation/devicetree/bindings/power/supply/bq256xx.yaml b/Documentation/devicetree/bindings/power/supply/bq256xx.yaml
index 8cee37b9879e..910229b78ef1 100644
--- a/Documentation/devicetree/bindings/power/supply/bq256xx.yaml
+++ b/Documentation/devicetree/bindings/power/supply/bq256xx.yaml
@@ -121,6 +121,6 @@ examples:
 
         input-voltage-limit-microvolt = <4500000>;
         input-current-limit-microamp = <2400000>;
-       };
+      };
     };
 ...
diff --git a/Documentation/devicetree/bindings/power/supply/cw2015_battery.yaml b/Documentation/devicetree/bindings/power/supply/cw2015_battery.yaml
index f7bde324153d..b2d8f347c082 100644
--- a/Documentation/devicetree/bindings/power/supply/cw2015_battery.yaml
+++ b/Documentation/devicetree/bindings/power/supply/cw2015_battery.yaml
@@ -70,8 +70,8 @@ examples:
                 0x48 0x77 0x9C 0xB3 0x80 0x52 0x94 0xCB
                 0x2F 0x00 0x64 0xA5 0xB5 0x11 0xF0 0x11
            >;
-           cellwise,monitor-interval-ms = <5000>;
-           monitored-battery = <&bat>;
-           power-supplies = <&mains_charger>, <&usb_charger>;
-       };
+            cellwise,monitor-interval-ms = <5000>;
+            monitored-battery = <&bat>;
+            power-supplies = <&mains_charger>, <&usb_charger>;
+        };
     };
diff --git a/Documentation/devicetree/bindings/power/supply/microchip,ucs1002.yaml b/Documentation/devicetree/bindings/power/supply/microchip,ucs1002.yaml
index b9bd1591ed7e..98fd92759b7f 100644
--- a/Documentation/devicetree/bindings/power/supply/microchip,ucs1002.yaml
+++ b/Documentation/devicetree/bindings/power/supply/microchip,ucs1002.yaml
@@ -47,5 +47,5 @@ examples:
             interrupts-extended = <&gpio5 2 IRQ_TYPE_EDGE_BOTH>,
                                   <&gpio3 21 IRQ_TYPE_EDGE_BOTH>;
             interrupt-names = "a_det", "alert";
-       };
+        };
     };
diff --git a/Documentation/devicetree/bindings/power/supply/sbs,sbs-battery.yaml b/Documentation/devicetree/bindings/power/supply/sbs,sbs-battery.yaml
index 90b9d3d882a4..0bf6dfbc4b22 100644
--- a/Documentation/devicetree/bindings/power/supply/sbs,sbs-battery.yaml
+++ b/Documentation/devicetree/bindings/power/supply/sbs,sbs-battery.yaml
@@ -80,5 +80,5 @@ examples:
             sbs,poll-retry-count = <10>;
             sbs,battery-detect-gpios = <&gpio 122 GPIO_ACTIVE_HIGH>;
             sbs,disable-charger-broadcasts;
-       };
+        };
     };
diff --git a/Documentation/devicetree/bindings/power/supply/sbs,sbs-charger.yaml b/Documentation/devicetree/bindings/power/supply/sbs,sbs-charger.yaml
index cb73ffa4778e..8e009af13a42 100644
--- a/Documentation/devicetree/bindings/power/supply/sbs,sbs-charger.yaml
+++ b/Documentation/devicetree/bindings/power/supply/sbs,sbs-charger.yaml
@@ -51,5 +51,5 @@ examples:
             reg = <0x9>;
             interrupt-parent = <&gpio6>;
             interrupts = <7 IRQ_TYPE_LEVEL_LOW>;
-       };
+        };
     };
diff --git a/Documentation/devicetree/bindings/pwm/nxp,mc33xs2410.yaml b/Documentation/devicetree/bindings/pwm/nxp,mc33xs2410.yaml
index 1729fe5c3dfb..46f2861f12d2 100644
--- a/Documentation/devicetree/bindings/pwm/nxp,mc33xs2410.yaml
+++ b/Documentation/devicetree/bindings/pwm/nxp,mc33xs2410.yaml
@@ -93,26 +93,26 @@ examples:
         #address-cells = <1>;
         #size-cells = <0>;
 
-       pwm@0 {
-           compatible = "nxp,mc33xs2410";
-           reg = <0x0>;
-           spi-max-frequency = <4000000>;
-           spi-cpha;
-           spi-cs-setup-delay-ns = <100>;
-           spi-cs-hold-delay-ns = <10>;
-           spi-cs-inactive-delay-ns = <300>;
-           reset-gpios = <&gpio3 22 GPIO_ACTIVE_LOW>;
-           #pwm-cells = <3>;
-           pwm-names = "di0", "di1", "di2", "di3";
-           pwms = <&pwm0 0 1000000>,
-                  <&pwm1 0 1000000>,
-                  <&pwm2 0 1000000>,
-                  <&pwm3 0 1000000>;
-           interrupt-parent = <&gpio0>;
-           interrupts = <31 IRQ_TYPE_LEVEL_LOW>;
-           clocks = <&clk_ext_fixed>;
-           vdd-supply = <&reg_3v3>;
-           vspi-supply = <&reg_3v3>;
-           vpwr-supply = <&reg_24v0>;
-       };
+        pwm@0 {
+            compatible = "nxp,mc33xs2410";
+            reg = <0x0>;
+            spi-max-frequency = <4000000>;
+            spi-cpha;
+            spi-cs-setup-delay-ns = <100>;
+            spi-cs-hold-delay-ns = <10>;
+            spi-cs-inactive-delay-ns = <300>;
+            reset-gpios = <&gpio3 22 GPIO_ACTIVE_LOW>;
+            #pwm-cells = <3>;
+            pwm-names = "di0", "di1", "di2", "di3";
+            pwms = <&pwm0 0 1000000>,
+                   <&pwm1 0 1000000>,
+                   <&pwm2 0 1000000>,
+                   <&pwm3 0 1000000>;
+            interrupt-parent = <&gpio0>;
+            interrupts = <31 IRQ_TYPE_LEVEL_LOW>;
+            clocks = <&clk_ext_fixed>;
+            vdd-supply = <&reg_3v3>;
+            vspi-supply = <&reg_3v3>;
+            vpwr-supply = <&reg_24v0>;
+        };
     };
diff --git a/Documentation/devicetree/bindings/pwm/thead,th1520-pwm.yaml b/Documentation/devicetree/bindings/pwm/thead,th1520-pwm.yaml
index 855aec59ac53..148f22b815eb 100644
--- a/Documentation/devicetree/bindings/pwm/thead,th1520-pwm.yaml
+++ b/Documentation/devicetree/bindings/pwm/thead,th1520-pwm.yaml
@@ -37,12 +37,12 @@ examples:
   - |
     #include <dt-bindings/clock/thead,th1520-clk-ap.h>
     soc {
-      #address-cells = <2>;
-      #size-cells = <2>;
-      pwm@ffec01c000 {
-          compatible = "thead,th1520-pwm";
-          reg = <0xff 0xec01c000 0x0 0x4000>;
-          clocks = <&clk CLK_PWM>;
-          #pwm-cells = <3>;
-      };
+        #address-cells = <2>;
+        #size-cells = <2>;
+        pwm@ffec01c000 {
+            compatible = "thead,th1520-pwm";
+            reg = <0xff 0xec01c000 0x0 0x4000>;
+            clocks = <&clk CLK_PWM>;
+            #pwm-cells = <3>;
+        };
     };
diff --git a/Documentation/devicetree/bindings/remoteproc/ti,k3-m4f-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/ti,k3-m4f-rproc.yaml
index 2bd0752b6ba9..597386a5840b 100644
--- a/Documentation/devicetree/bindings/remoteproc/ti,k3-m4f-rproc.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/ti,k3-m4f-rproc.yaml
@@ -121,5 +121,5 @@ examples:
             ti,sci = <&dmsc>;
             ti,sci-dev-id = <9>;
             ti,sci-proc-ids = <0x18 0xff>;
-         };
+        };
     };
diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
index 0da219ae6769..399453d03cfb 100644
--- a/Documentation/devicetree/bindings/riscv/cpus.yaml
+++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
@@ -167,47 +167,47 @@ examples:
         #size-cells = <0>;
         timebase-frequency = <1000000>;
         cpu@0 {
-                clock-frequency = <0>;
-                compatible = "sifive,rocket0", "riscv";
-                device_type = "cpu";
-                i-cache-block-size = <64>;
-                i-cache-sets = <128>;
-                i-cache-size = <16384>;
-                reg = <0>;
-                riscv,isa-base = "rv64i";
-                riscv,isa-extensions = "i", "m", "a", "c";
+            clock-frequency = <0>;
+            compatible = "sifive,rocket0", "riscv";
+            device_type = "cpu";
+            i-cache-block-size = <64>;
+            i-cache-sets = <128>;
+            i-cache-size = <16384>;
+            reg = <0>;
+            riscv,isa-base = "rv64i";
+            riscv,isa-extensions = "i", "m", "a", "c";
 
-                cpu_intc0: interrupt-controller {
-                        #interrupt-cells = <1>;
-                        compatible = "riscv,cpu-intc";
-                        interrupt-controller;
-                };
+            cpu_intc0: interrupt-controller {
+                #interrupt-cells = <1>;
+                compatible = "riscv,cpu-intc";
+                interrupt-controller;
+            };
         };
         cpu@1 {
-                clock-frequency = <0>;
-                compatible = "sifive,rocket0", "riscv";
-                d-cache-block-size = <64>;
-                d-cache-sets = <64>;
-                d-cache-size = <32768>;
-                d-tlb-sets = <1>;
-                d-tlb-size = <32>;
-                device_type = "cpu";
-                i-cache-block-size = <64>;
-                i-cache-sets = <64>;
-                i-cache-size = <32768>;
-                i-tlb-sets = <1>;
-                i-tlb-size = <32>;
-                mmu-type = "riscv,sv39";
-                reg = <1>;
-                tlb-split;
-                riscv,isa-base = "rv64i";
-                riscv,isa-extensions = "i", "m", "a", "f", "d", "c";
+            clock-frequency = <0>;
+            compatible = "sifive,rocket0", "riscv";
+            d-cache-block-size = <64>;
+            d-cache-sets = <64>;
+            d-cache-size = <32768>;
+            d-tlb-sets = <1>;
+            d-tlb-size = <32>;
+            device_type = "cpu";
+            i-cache-block-size = <64>;
+            i-cache-sets = <64>;
+            i-cache-size = <32768>;
+            i-tlb-sets = <1>;
+            i-tlb-size = <32>;
+            mmu-type = "riscv,sv39";
+            reg = <1>;
+            tlb-split;
+            riscv,isa-base = "rv64i";
+            riscv,isa-extensions = "i", "m", "a", "f", "d", "c";
 
-                cpu_intc1: interrupt-controller {
-                        #interrupt-cells = <1>;
-                        compatible = "riscv,cpu-intc";
-                        interrupt-controller;
-                };
+            cpu_intc1: interrupt-controller {
+                #interrupt-cells = <1>;
+                compatible = "riscv,cpu-intc";
+                interrupt-controller;
+            };
         };
     };
 
@@ -217,18 +217,18 @@ examples:
         #address-cells = <1>;
         #size-cells = <0>;
         cpu@0 {
-                device_type = "cpu";
-                reg = <0>;
-                compatible = "riscv";
-                mmu-type = "riscv,sv48";
-                riscv,isa-base = "rv64i";
-                riscv,isa-extensions = "i", "m", "a", "f", "d", "c";
+            device_type = "cpu";
+            reg = <0>;
+            compatible = "riscv";
+            mmu-type = "riscv,sv48";
+            riscv,isa-base = "rv64i";
+            riscv,isa-extensions = "i", "m", "a", "f", "d", "c";
 
-                interrupt-controller {
-                        #interrupt-cells = <1>;
-                        interrupt-controller;
-                        compatible = "riscv,cpu-intc";
-                };
+            interrupt-controller {
+                #interrupt-cells = <1>;
+                interrupt-controller;
+                compatible = "riscv,cpu-intc";
+            };
         };
     };
 ...
diff --git a/Documentation/devicetree/bindings/rtc/nxp,pcf85063.yaml b/Documentation/devicetree/bindings/rtc/nxp,pcf85063.yaml
index f7013cd8fc20..c08c877f8ee3 100644
--- a/Documentation/devicetree/bindings/rtc/nxp,pcf85063.yaml
+++ b/Documentation/devicetree/bindings/rtc/nxp,pcf85063.yaml
@@ -87,17 +87,17 @@ examples:
         #size-cells = <0>;
 
         rtc@51 {
-          compatible = "nxp,pcf85063a";
-          reg = <0x51>;
-          quartz-load-femtofarads = <12500>;
+            compatible = "nxp,pcf85063a";
+            reg = <0x51>;
+            quartz-load-femtofarads = <12500>;
 
-          clock {
-            compatible = "fixed-clock";
-            #clock-cells = <0>;
-            clock-frequency = <32768>;
-          };
+            clock {
+                compatible = "fixed-clock";
+                #clock-cells = <0>;
+                clock-frequency = <32768>;
+            };
         };
-      };
+    };
 
   - |
     spi {
diff --git a/Documentation/devicetree/bindings/slimbus/slimbus.yaml b/Documentation/devicetree/bindings/slimbus/slimbus.yaml
index 3910327c8ded..9ba8711ac1c8 100644
--- a/Documentation/devicetree/bindings/slimbus/slimbus.yaml
+++ b/Documentation/devicetree/bindings/slimbus/slimbus.yaml
@@ -84,13 +84,13 @@ examples:
             #address-cells = <1>;
             #size-cells = <0>;
             slim@1 {
-              reg = <1>;
-              #address-cells = <2>;
-              #size-cells = <0>;
-              codec@1,0 {
-                compatible = "slim217,1a0";
-                reg = <1 0>;
-              };
+                reg = <1>;
+                #address-cells = <2>;
+                #size-cells = <0>;
+                codec@1,0 {
+                    compatible = "slim217,1a0";
+                    reg = <1 0>;
+                };
             };
-          };
         };
+    };
diff --git a/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,qe-muram.yaml b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,qe-muram.yaml
index 2c06d869fdb5..2c8fbb6971e2 100644
--- a/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,qe-muram.yaml
+++ b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,qe-muram.yaml
@@ -67,4 +67,4 @@ examples:
                          "fsl,cpm-muram-data";
             reg = <0 0xc000>;
         };
-     };
+    };
diff --git a/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,qe.yaml b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,qe.yaml
index 89cdf5e1d0a8..34b504452a36 100644
--- a/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,qe.yaml
+++ b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,qe.yaml
@@ -129,8 +129,8 @@ examples:
         };
 
         siram@1000 {
-          compatible = "fsl,t1040-qe-siram";
-          reg = <0x1000 0x800>;
+            compatible = "fsl,t1040-qe-siram";
+            reg = <0x1000 0x800>;
         };
 
         muram@10000 {
@@ -139,10 +139,10 @@ examples:
             #address-cells = <1>;
             #size-cells = <1>;
 
-              data-only@0{
-                  compatible = "fsl,qe-muram-data",
-                              "fsl,cpm-muram-data";
-                  reg = <0 0xc000>;
-              };
+            data-only@0{
+                compatible = "fsl,qe-muram-data",
+                             "fsl,cpm-muram-data";
+                reg = <0 0xc000>;
+            };
         };
     };
diff --git a/Documentation/devicetree/bindings/soc/imx/fsl,imx8mm-disp-blk-ctrl.yaml b/Documentation/devicetree/bindings/soc/imx/fsl,imx8mm-disp-blk-ctrl.yaml
index a02a09d574a2..3b619406e26c 100644
--- a/Documentation/devicetree/bindings/soc/imx/fsl,imx8mm-disp-blk-ctrl.yaml
+++ b/Documentation/devicetree/bindings/soc/imx/fsl,imx8mm-disp-blk-ctrl.yaml
@@ -87,8 +87,8 @@ examples:
                <&clk IMX8MM_CLK_DSI_PHY_REF>,
                <&clk IMX8MM_CLK_CSI1_CORE>,
                <&clk IMX8MM_CLK_CSI1_PHY_REF>;
-       clock-names = "csi-bridge-axi", "csi-bridge-apb", "csi-bridge-core",
-                     "lcdif-axi", "lcdif-apb", "lcdif-pix", "dsi-pclk",
-                     "dsi-ref", "csi-aclk", "csi-pclk";
-       #power-domain-cells = <1>;
+      clock-names = "csi-bridge-axi", "csi-bridge-apb", "csi-bridge-core",
+                    "lcdif-axi", "lcdif-apb", "lcdif-pix", "dsi-pclk",
+                    "dsi-ref", "csi-aclk", "csi-pclk";
+      #power-domain-cells = <1>;
     };
diff --git a/Documentation/devicetree/bindings/soc/imx/fsl,imx8mn-disp-blk-ctrl.yaml b/Documentation/devicetree/bindings/soc/imx/fsl,imx8mn-disp-blk-ctrl.yaml
index eeec9965b091..f780e18cd318 100644
--- a/Documentation/devicetree/bindings/soc/imx/fsl,imx8mn-disp-blk-ctrl.yaml
+++ b/Documentation/devicetree/bindings/soc/imx/fsl,imx8mn-disp-blk-ctrl.yaml
@@ -90,8 +90,8 @@ examples:
                <&clk IMX8MN_CLK_DSI_PHY_REF>,
                <&clk IMX8MN_CLK_CSI1_PHY_REF>,
                <&clk IMX8MN_CLK_CAMERA_PIXEL_ROOT>;
-       clock-names = "disp_axi", "disp_apb", "disp_axi_root", "disp_apb_root",
-                     "lcdif-axi", "lcdif-apb", "lcdif-pix", "dsi-pclk",
-                     "dsi-ref", "csi-aclk", "csi-pclk";
-       #power-domain-cells = <1>;
+      clock-names = "disp_axi", "disp_apb", "disp_axi_root", "disp_apb_root",
+                    "lcdif-axi", "lcdif-apb", "lcdif-pix", "dsi-pclk",
+                    "dsi-ref", "csi-aclk", "csi-pclk";
+      #power-domain-cells = <1>;
     };
diff --git a/Documentation/devicetree/bindings/soc/imx/fsl,imx93-media-blk-ctrl.yaml b/Documentation/devicetree/bindings/soc/imx/fsl,imx93-media-blk-ctrl.yaml
index 124f5c206ee3..4568b45a30ad 100644
--- a/Documentation/devicetree/bindings/soc/imx/fsl,imx93-media-blk-ctrl.yaml
+++ b/Documentation/devicetree/bindings/soc/imx/fsl,imx93-media-blk-ctrl.yaml
@@ -173,8 +173,8 @@ examples:
                <&clk IMX93_CLK_ISI_GATE>,
                <&clk IMX93_CLK_MIPI_CSI_GATE>,
                <&clk IMX93_CLK_MIPI_DSI_GATE>;
-               clock-names = "apb", "axi", "nic", "disp", "cam",
-                             "pxp", "lcdif", "isi", "csi", "dsi";
+      clock-names = "apb", "axi", "nic", "disp", "cam",
+                    "pxp", "lcdif", "isi", "csi", "dsi";
       #address-cells = <1>;
       #size-cells = <1>;
       #power-domain-cells = <1>;
diff --git a/Documentation/devicetree/bindings/soc/mediatek/mediatek,mt8183-dvfsrc.yaml b/Documentation/devicetree/bindings/soc/mediatek/mediatek,mt8183-dvfsrc.yaml
index 27cce748e0ca..ed3e45044805 100644
--- a/Documentation/devicetree/bindings/soc/mediatek/mediatek,mt8183-dvfsrc.yaml
+++ b/Documentation/devicetree/bindings/soc/mediatek/mediatek,mt8183-dvfsrc.yaml
@@ -68,17 +68,17 @@ examples:
                 compatible = "mediatek,mt8195-dvfsrc-regulator";
 
                 dvfsrc_vcore: dvfsrc-vcore {
-                        regulator-name = "dvfsrc-vcore";
-                        regulator-min-microvolt = <550000>;
-                        regulator-max-microvolt = <750000>;
-                        regulator-always-on;
+                    regulator-name = "dvfsrc-vcore";
+                    regulator-min-microvolt = <550000>;
+                    regulator-max-microvolt = <750000>;
+                    regulator-always-on;
                 };
 
                 dvfsrc_vscp: dvfsrc-vscp {
-                        regulator-name = "dvfsrc-vscp";
-                        regulator-min-microvolt = <550000>;
-                        regulator-max-microvolt = <750000>;
-                        regulator-always-on;
+                    regulator-name = "dvfsrc-vscp";
+                    regulator-min-microvolt = <550000>;
+                    regulator-max-microvolt = <750000>;
+                    regulator-always-on;
                 };
             };
 
diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,rpmh-rsc.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,rpmh-rsc.yaml
index 1889139a3f7a..b2446d9cf5b8 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,rpmh-rsc.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,rpmh-rsc.yaml
@@ -177,7 +177,7 @@ examples:
                           <WAKE_TCS    3>,
                           <CONTROL_TCS 1>;
         power-domains = <&CLUSTER_PD>;
-      };
+    };
 
   - |
     // For a TCS whose RSC base address is 0xAF20000 and is at DRV id of 0, the
diff --git a/Documentation/devicetree/bindings/soc/rockchip/grf.yaml b/Documentation/devicetree/bindings/soc/rockchip/grf.yaml
index 7bcb4e2f47ec..7245444fd088 100644
--- a/Documentation/devicetree/bindings/soc/rockchip/grf.yaml
+++ b/Documentation/devicetree/bindings/soc/rockchip/grf.yaml
@@ -374,7 +374,7 @@ examples:
           #phy-cells = <0>;
           interrupts = <GIC_SPI 27 IRQ_TYPE_LEVEL_HIGH 0>;
           interrupt-names = "linestate";
-         };
+        };
 
         u2phy0_otg: otg-port {
           #phy-cells = <0>;
diff --git a/Documentation/devicetree/bindings/soc/ti/k3-ringacc.yaml b/Documentation/devicetree/bindings/soc/ti/k3-ringacc.yaml
index 158186610c53..e8e22e8685d2 100644
--- a/Documentation/devicetree/bindings/soc/ti/k3-ringacc.yaml
+++ b/Documentation/devicetree/bindings/soc/ti/k3-ringacc.yaml
@@ -86,7 +86,7 @@ examples:
                   <0x0 0x31120000 0x0 0x100>,
                   <0x0 0x33000000 0x0 0x40000>,
                   <0x0 0x31080000 0x0 0x40000>;
-                  reg-names = "rt", "fifos", "proxy_gcfg", "proxy_target", "cfg";
+            reg-names = "rt", "fifos", "proxy_gcfg", "proxy_target", "cfg";
             ti,num-rings = <818>;
             ti,sci-rm-range-gp-rings = <0x2>; /* GP ring range */
             ti,sci = <&dmsc>;
diff --git a/Documentation/devicetree/bindings/spi/amlogic,a4-spifc.yaml b/Documentation/devicetree/bindings/spi/amlogic,a4-spifc.yaml
index b4cef838bcd4..dc745aa6393e 100644
--- a/Documentation/devicetree/bindings/spi/amlogic,a4-spifc.yaml
+++ b/Documentation/devicetree/bindings/spi/amlogic,a4-spifc.yaml
@@ -58,25 +58,25 @@ unevaluatedProperties: false
 examples:
   - |
     sfc0: spi@fe08d000 {
-      compatible = "amlogic,a4-spifc";
-      reg = <0xfe08d000 0x800>;
-      clocks = <&clkc_periphs 31>,
-               <&clkc_periphs 102>;
-      clock-names = "gate", "core";
+        compatible = "amlogic,a4-spifc";
+        reg = <0xfe08d000 0x800>;
+        clocks = <&clkc_periphs 31>,
+                 <&clkc_periphs 102>;
+        clock-names = "gate", "core";
 
-      pinctrl-0 = <&spiflash_default>;
-      pinctrl-names = "default";
+        pinctrl-0 = <&spiflash_default>;
+        pinctrl-names = "default";
 
-      #address-cells = <1>;
-      #size-cells = <0>;
+        #address-cells = <1>;
+        #size-cells = <0>;
 
-      flash@0 {
-          compatible = "spi-nand";
-          reg = <0>;
-          #address-cells = <1>;
-          #size-cells = <1>;
-          nand-ecc-engine = <&sfc0>;
-          nand-ecc-strength = <8>;
-          nand-ecc-step-size = <512>;
-      };
+        flash@0 {
+            compatible = "spi-nand";
+            reg = <0>;
+            #address-cells = <1>;
+            #size-cells = <1>;
+            nand-ecc-engine = <&sfc0>;
+            nand-ecc-strength = <8>;
+            nand-ecc-step-size = <512>;
+        };
     };
diff --git a/Documentation/devicetree/bindings/spi/marvell,orion-spi.yaml b/Documentation/devicetree/bindings/spi/marvell,orion-spi.yaml
index 7f5ec1d7f59b..ad5b33f41dff 100644
--- a/Documentation/devicetree/bindings/spi/marvell,orion-spi.yaml
+++ b/Documentation/devicetree/bindings/spi/marvell,orion-spi.yaml
@@ -67,13 +67,13 @@ unevaluatedProperties: false
 examples:
   - |
     spi@10600 {
-      compatible = "marvell,orion-spi";
-      #address-cells = <1>;
-      #size-cells = <0>;
-      cell-index = <0>;
-      reg = <0x10600 0x28>;
-      clocks = <&coreclk 0>;
-      interrupts = <23>;
+        compatible = "marvell,orion-spi";
+        #address-cells = <1>;
+        #size-cells = <0>;
+        cell-index = <0>;
+        reg = <0x10600 0x28>;
+        clocks = <&coreclk 0>;
+        interrupts = <23>;
     };
   - |
     #define MBUS_ID(target,attributes) (((target) << 24) | ((attributes) << 16))
@@ -83,20 +83,20 @@ examples:
         #size-cells = <1>;
 
         spi@10600 {
-          compatible = "marvell,orion-spi";
-          #address-cells = <1>;
-          #size-cells = <0>;
-          cell-index = <0>;
-          reg = <MBUS_ID(0xf0, 0x01) 0x10600 0x28>, /* control */
-                <MBUS_ID(0x01, 0x1e) 0 0xffffffff>, /* CS0 */
-                <MBUS_ID(0x01, 0x5e) 0 0xffffffff>, /* CS1 */
-                <MBUS_ID(0x01, 0x9e) 0 0xffffffff>, /* CS2 */
-                <MBUS_ID(0x01, 0xde) 0 0xffffffff>, /* CS3 */
-                <MBUS_ID(0x01, 0x1f) 0 0xffffffff>, /* CS4 */
-                <MBUS_ID(0x01, 0x5f) 0 0xffffffff>, /* CS5 */
-                <MBUS_ID(0x01, 0x9f) 0 0xffffffff>, /* CS6 */
-                <MBUS_ID(0x01, 0xdf) 0 0xffffffff>; /* CS7 */
-          clocks = <&coreclk 0>;
-          interrupts = <23>;
+            compatible = "marvell,orion-spi";
+            #address-cells = <1>;
+            #size-cells = <0>;
+            cell-index = <0>;
+            reg = <MBUS_ID(0xf0, 0x01) 0x10600 0x28>, /* control */
+                  <MBUS_ID(0x01, 0x1e) 0 0xffffffff>, /* CS0 */
+                  <MBUS_ID(0x01, 0x5e) 0 0xffffffff>, /* CS1 */
+                  <MBUS_ID(0x01, 0x9e) 0 0xffffffff>, /* CS2 */
+                  <MBUS_ID(0x01, 0xde) 0 0xffffffff>, /* CS3 */
+                  <MBUS_ID(0x01, 0x1f) 0 0xffffffff>, /* CS4 */
+                  <MBUS_ID(0x01, 0x5f) 0 0xffffffff>, /* CS5 */
+                  <MBUS_ID(0x01, 0x9f) 0 0xffffffff>, /* CS6 */
+                  <MBUS_ID(0x01, 0xdf) 0 0xffffffff>; /* CS7 */
+            clocks = <&coreclk 0>;
+            interrupts = <23>;
         };
     };
diff --git a/Documentation/devicetree/bindings/thermal/brcm,sr-thermal.yaml b/Documentation/devicetree/bindings/thermal/brcm,sr-thermal.yaml
index 576a627cd599..e719d62e58b5 100644
--- a/Documentation/devicetree/bindings/thermal/brcm,sr-thermal.yaml
+++ b/Documentation/devicetree/bindings/thermal/brcm,sr-thermal.yaml
@@ -46,76 +46,76 @@ examples:
     };
 
     thermal-zones {
-      ihost0_thermal: ihost0-thermal {
-        polling-delay-passive = <0>;
-        polling-delay = <1000>;
-        thermal-sensors = <&tmon 0>;
-        trips {
-          cpu-crit {
-            temperature = <105000>;
-            hysteresis = <0>;
-            type = "critical";
-          };
+        ihost0_thermal: ihost0-thermal {
+            polling-delay-passive = <0>;
+            polling-delay = <1000>;
+            thermal-sensors = <&tmon 0>;
+            trips {
+                cpu-crit {
+                    temperature = <105000>;
+                    hysteresis = <0>;
+                    type = "critical";
+                };
+            };
         };
-      };
-      ihost1_thermal: ihost1-thermal {
-        polling-delay-passive = <0>;
-        polling-delay = <1000>;
-        thermal-sensors = <&tmon 1>;
-        trips {
-          cpu-crit {
-            temperature = <105000>;
-            hysteresis = <0>;
-            type = "critical";
-          };
+        ihost1_thermal: ihost1-thermal {
+            polling-delay-passive = <0>;
+            polling-delay = <1000>;
+            thermal-sensors = <&tmon 1>;
+            trips {
+                cpu-crit {
+                    temperature = <105000>;
+                    hysteresis = <0>;
+                    type = "critical";
+                };
+            };
         };
-      };
-      ihost2_thermal: ihost2-thermal {
-        polling-delay-passive = <0>;
-        polling-delay = <1000>;
-        thermal-sensors = <&tmon 2>;
-        trips {
-          cpu-crit {
-            temperature = <105000>;
-            hysteresis = <0>;
-            type = "critical";
-          };
+        ihost2_thermal: ihost2-thermal {
+            polling-delay-passive = <0>;
+            polling-delay = <1000>;
+            thermal-sensors = <&tmon 2>;
+            trips {
+                cpu-crit {
+                    temperature = <105000>;
+                    hysteresis = <0>;
+                    type = "critical";
+                };
+            };
         };
-      };
-      ihost3_thermal: ihost3-thermal {
-        polling-delay-passive = <0>;
-        polling-delay = <1000>;
-        thermal-sensors = <&tmon 3>;
-        trips {
-          cpu-crit {
-            temperature = <105000>;
-            hysteresis = <0>;
-            type = "critical";
-          };
+        ihost3_thermal: ihost3-thermal {
+            polling-delay-passive = <0>;
+            polling-delay = <1000>;
+            thermal-sensors = <&tmon 3>;
+            trips {
+                cpu-crit {
+                    temperature = <105000>;
+                    hysteresis = <0>;
+                    type = "critical";
+                };
+            };
         };
-      };
-      crmu_thermal: crmu-thermal {
-        polling-delay-passive = <0>;
-        polling-delay = <1000>;
-        thermal-sensors = <&tmon 4>;
-        trips {
-          cpu-crit {
-            temperature = <105000>;
-            hysteresis = <0>;
-            type = "critical";
-          };
+        crmu_thermal: crmu-thermal {
+            polling-delay-passive = <0>;
+            polling-delay = <1000>;
+            thermal-sensors = <&tmon 4>;
+            trips {
+                cpu-crit {
+                    temperature = <105000>;
+                    hysteresis = <0>;
+                    type = "critical";
+                };
+            };
         };
-      };
-      nitro_thermal: nitro-thermal {
-        polling-delay-passive = <0>;
-        polling-delay = <1000>;
-        thermal-sensors = <&tmon 5>;
-        trips {
-          cpu-crit {
-            temperature = <105000>;
-            hysteresis = <0>;
-            type = "critical";
-          };
+        nitro_thermal: nitro-thermal {
+            polling-delay-passive = <0>;
+            polling-delay = <1000>;
+            thermal-sensors = <&tmon 5>;
+            trips {
+                cpu-crit {
+                    temperature = <105000>;
+                    hysteresis = <0>;
+                    type = "critical";
+                };
+            };
         };
-      };
     };
diff --git a/Documentation/devicetree/bindings/timer/nxp,sysctr-timer.yaml b/Documentation/devicetree/bindings/timer/nxp,sysctr-timer.yaml
index 6b80b060672e..58b532f9708f 100644
--- a/Documentation/devicetree/bindings/timer/nxp,sysctr-timer.yaml
+++ b/Documentation/devicetree/bindings/timer/nxp,sysctr-timer.yaml
@@ -62,4 +62,4 @@ examples:
         clocks = <&clk_8m>;
         clock-names = "per";
         interrupts = <GIC_SPI 47 IRQ_TYPE_LEVEL_HIGH>;
-     };
+    };
diff --git a/Documentation/devicetree/bindings/watchdog/microchip,pic32mzda-dmt.yaml b/Documentation/devicetree/bindings/watchdog/microchip,pic32mzda-dmt.yaml
index 01638624e334..db82868e0c07 100644
--- a/Documentation/devicetree/bindings/watchdog/microchip,pic32mzda-dmt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/microchip,pic32mzda-dmt.yaml
@@ -42,4 +42,4 @@ examples:
         compatible = "microchip,pic32mzda-dmt";
         reg = <0x1f800a00 0x80>;
         clocks = <&rootclk PB7CLK>;
-       };
+    };
diff --git a/Documentation/devicetree/bindings/watchdog/nuvoton,ma35d1-wdt.yaml b/Documentation/devicetree/bindings/watchdog/nuvoton,ma35d1-wdt.yaml
index aced7d77a7d3..7dff699e1a90 100644
--- a/Documentation/devicetree/bindings/watchdog/nuvoton,ma35d1-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/nuvoton,ma35d1-wdt.yaml
@@ -46,10 +46,10 @@ examples:
         #address-cells = <2>;
         #size-cells = <2>;
         wdt1: watchdog@40440000 {
-          compatible = "nuvoton,ma35d1-wdt";
-          reg = <0x0 0x40440000 0x0 0x100>;
-          interrupts = <GIC_SPI 43 IRQ_TYPE_LEVEL_HIGH>;
-          clocks = <&clk WDT1_GATE>;
+            compatible = "nuvoton,ma35d1-wdt";
+            reg = <0x0 0x40440000 0x0 0x100>;
+            interrupts = <GIC_SPI 43 IRQ_TYPE_LEVEL_HIGH>;
+            clocks = <&clk WDT1_GATE>;
         };
     };
 ...
-- 
2.53.0

