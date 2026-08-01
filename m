Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 494D71DED4C
	for <linux-renesas-soc@vger.kernel.org>; Sat,  1 Aug 2026 19:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785614127; cv=none; b=e0DRtmOGtXZRPbev+NoBYVANJb2E3YrrxQUVWW7xxBXI/Bvgx/yiQapqF2kHKIC8yH2gSiIeOXf1Jdd3PnOO1qyI4YR0vHghbEjsPkgKX2W1IobS4VqDG0PsOKenFG68MBpUGXlX7RT9v3d7oIpPypTBmsztDZCYjZXUP/I8OX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785614127; c=relaxed/simple;
	bh=mZHWAuSeKaFREk3s3TsCeBqYcHg010+ZFZVBB6WI64A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tRte0952/m7EfbSfItkeE+3OL84lTmldJQeglGQLdl7dec+yh7Mv3MrGJmxvUY8eWpgrkuJKbC4wQoN3HBpN35FpGw4Zmzy7LrjiHixzQfxlvAF6vHWaJrJkQAgp9XEjjEN7+HWjJNPnwbmN8PO+sWjZvwJN8db2zBRfMspy7Co=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fS8+P9BR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FEVv4evp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fS8+P9BR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FEVv4evp"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 671J0iQA043093
	for <linux-renesas-soc@vger.kernel.org>; Sat, 1 Aug 2026 19:55:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=hi7qwC9Ys33lceH7czkrRMTjgxXHEZVRfXr
	RqrzJ6fM=; b=fS8+P9BRkVoF4CeszARZydRmMHsGFpCDRysHyyvhuEqtNEaNgKk
	Pk4MIK75koHduD6b0/9SWn5zXBY6rMEBE2tlh2+M9hCmMgY/jpFO9BXke0wpWMAz
	D4mpk5LXuKNd1lk3BAClAjBTOFYYhZgmsLfAV6kcbCrXGAzzx/I/aezFi2t/xtSI
	1T330uvbYvyL5N0sEgXjIuMCy/W7AA1SuSEuliO6uJ1IxCciX+RG/G+mlxTBD5dk
	rOVzkJ6KKhZMYQlfZfeafTRA1btS1RJ0jbyTNqx9bXollh9GaNeq4ctHxSVfJjgw
	d95zyvN6ynxZtx0pMFP5c/K9r+7lqH7tGzg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fs8qpsjgy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Sat, 01 Aug 2026 19:55:25 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5276aa86d00so21894351cf.2
        for <linux-renesas-soc@vger.kernel.org>; Sat, 01 Aug 2026 12:55:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785614124; x=1786218924; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hi7qwC9Ys33lceH7czkrRMTjgxXHEZVRfXrRqrzJ6fM=;
        b=FEVv4evp7K3vsXANZvgG2IPI9lwducrHqOcWBt6ADsKH/wdT1ypsmdNig8W9MnQcws
         pObYQtHUxdSoutzbfihhlc2VGe5QqRTTKmLFJ6vEauuduk/XkVrgdzc/YZJhrooQ+GRJ
         Ej6yl0rVp+o0V7SSkZj+yvKntk6eeaZ+CiQO9UnZq7k2hB9r/9jIL1ffJbeXx5YwBQvp
         akEe8zmEQRxVhYM0WGzTrH8xfjQEX8U1burOtFlzTuUxrZxG5Y9/najMRX7B3HoXzNM5
         6ju2kzZmnAxtmSMgfvhOVWocWk4sdGpWR3dDx4Peh2xPzqqzXbbXp28nx8At+K82eqWo
         bbHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785614124; x=1786218924;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hi7qwC9Ys33lceH7czkrRMTjgxXHEZVRfXrRqrzJ6fM=;
        b=g8dwwsSfHDB3BFplozko8CTuXH1J7vhMluTltxQFH4PNU6k+WFeR5jElFLd+uOs6sv
         JNdMfHP+avwVWeN2jlzSDMHxQeQh1PJDe4YGceeuxgIYdvP99f7e1LZZ2/Jcu3Wohbac
         y2IqDEK2swY1rIEhW+KtaCfC40WYiilzSQi2QL5FMRVSVJLc6GBiACkuBYlwZ4SQgGVx
         N0TJKWLhJLatihzbkYwh5ckgeYtqa5q9oPj5ni7S69aO45jG771d/kKAJcGGy9Q3MI/r
         siGXRlWdAF3dajBxYeuou4o/7pFErbwNCbTReZs9WmJC7zFwBVX9hM5+kzmfeputgDfT
         ExaA==
X-Forwarded-Encrypted: i=1; AHgh+Rqe+OlQxQJ7wxDPGK5dunJ2wikeCOGzLkw4Cg0zLqSac8h3hwLWYcB/Ze6zn1JlxNcRFpQ0ZSuS80Y1H9hBkcW/UQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwDJXqHQjPR3xzGAIyo+8vqWOByh4nMVIVKLy1KcygcVHe1+UQe
	dCkUJI5Dfq7l0+wYhT/aPumTQnHJmOxxFJiuvzXGbeF6yi9ltjrzKcfzWWJZ3YFUGwuatSycdoX
	/FNrAHBMBP79TRyjKSLfabJeBdQTtzBbhodcjji7zITSgAGNfB4eLupeI/2qSYw+2TIG97yjxtQ
	==
X-Gm-Gg: AR+sD13GOkN49PC6bgwMr1S5yKKuwKziAsV1Vy/GcU486k0kMK4rWYzCbFa5HOsYchn
	jSbegEDrsjOhEOLpGijNuIYOWd/sgDjg+6jVTPLuayqVVvP2VaTsFd1FDiEqWvnjP79IwA3htI6
	MaouKMClJeaDYCf0wLkc4dmGmvSQwI5sSGnAwZWI0VIwXaZi7FWmsxsqn1meRCyo7A85HqA0q27
	K+6IFrE64gF+ThQ5JnYQbiMdq19B8UzHvGaAeCkDJEZA7hAfe7nW8byX2cvQ65IH6Xc8HpcKbCJ
	ws3cOiTlB5aTTIaq//FwFH8i01XK9SqS+21fC6f6pZTWnB+Nxp7c+Z616e1l5/l6pHM/gY3leUO
	1Ja1FG3I+t0l0fSWI
X-Received: by 2002:a05:622a:4d0f:b0:51a:ee21:d342 with SMTP id d75a77b69052e-52b567522acmr111615731cf.20.1785614124575;
        Sat, 01 Aug 2026 12:55:24 -0700 (PDT)
X-Received: by 2002:a05:622a:4d0f:b0:51a:ee21:d342 with SMTP id d75a77b69052e-52b567522acmr111615461cf.20.1785614124198;
        Sat, 01 Aug 2026 12:55:24 -0700 (PDT)
Received: from quoll ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49807b5f0c3sm74694415e9.5.2026.08.01.12.55.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 12:55:23 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Jim Quinlan <jim2101024@gmail.com>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Marek Vasut <marek.vasut+renesas@mailbox.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Kishon Vijay Abraham I <kishon@kernel.org>, linux-pci@vger.kernel.org,
        linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] dt-bindings: PCI: Correct white-space style
Date: Sat,  1 Aug 2026 21:55:18 +0200
Message-ID: <20260801195517.235161-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3897; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=mZHWAuSeKaFREk3s3TsCeBqYcHg010+ZFZVBB6WI64A=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqbk8lI71bPd+afSLiOOSgUBFK9QNKQ/CfX7jgg
 +ZIgESpx62JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCam5PJQAKCRDBN2bmhouD
 1+giD/9UrL5r6rohmURssJaLdBSj35eMCF6Q1TlSBx0A/k8Xyn/QQd0NRXPEJ7nd3yWpo4KvjGW
 hew4ADAPDXJ7xADCHaR9enIQy3jUBzrdlwZgSoH55vZ3C26JJjza3AiWAGJ2zF5AY1X2WHa6dcN
 aUCyT70cH3Ya1EmjSmu8Hx1KZssBfRyfBpQ9NvlxyJsv/dAk8pyxnfb9f3UCHT1PHEoTMKFLnKZ
 4JR8wYnwuRHuokyEo1bJ/FdYdAbmm4URgjmuY1UuYSC8kYGHeBYj3dp2x6NuhGC9dKnqsL/Tuh3
 Y49QLumAhjBrIyvL7WtOSlEJ2IKpSBzC05MI3z1lZbfAvnSnmhOydMmjgaDpgRsbK/TIIMAOb8v
 LyI2/L1UH2zJ5b2OX1FgwH9TKiBuwJIGSmKIuYrre+HJKweoXXTP20LyikioNFwIFJRp0NTO6XC
 X7BG584MJOvN8rov/tkkeDv1hZmyjC0cSsaRCp1yEyYMdej5t/bPax/8CdWmOAhFt/zI47adrJQ
 htQE+Ybt4eRgpGACK2goN0+SKq/OvExKomF1z9P5yi8v4ckE/h8T8A6JSuUcBlssJXtnrd8Ktmz
 esoHVN33bXl0oLQw9Hpxz08GxnqVbyibDfRUF3tB9nVdSGreDv2hN/mkN+VPM+BxKpmETANXXOo k+2AaWGFfaR+dpg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAxMDE2MCBTYWx0ZWRfX5qnBQ7z1MsN7
 e0KD4UTlBKqrnVL+k8iOWTPtlfkCrL/vr6RjL7zafz2DclRdNBwDJcqkXYihUxihRt8pAu/fEAd
 ud/qMhdgUMt+vdZEdJw2hpJdQwMYJTwXkfIAVVO+OC4You+eHVmhsp0uT2DM6Y3B0oCF/ZWcDxo
 dbJ/NCLZkLn4vIwN591fK/X5s8cHtHlN6uzWYekQ+cfAa3SmRiiw7+DBrGNu00aRa3NYMBe8S4h
 VWp8kjFbq/wzogUV9X4zbB4gyONxo9KtkFsHAjfU8SJ7Z4nzhL8AdKj3Vz26fPPlbucq1LjL2+C
 1jlLCDDOY/HsVZTKyfhnznLtJNmExg7p7RkyXqON8q8vSVCiVQikF1LWkUmFkQrFWPh/urCoUJr
 d+lIb0eovSZKwwZOvrg+V/8yRyrOy/Q0GYg8NiQyOl0SmH3d/O2DG8Hx0vvJd8q+5gQJIfs7bxc
 S626l9oVXcvLgUA8I2A==
X-Proofpoint-GUID: BMycm-p-mcG2jr6QL0B83cNhsOCB2HXc
X-Authority-Analysis: v=2.4 cv=MpViLWae c=1 sm=1 tr=0 ts=6a6e4f2d cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=mxJljgaHxS3Sv8GYpwQA:9 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: BMycm-p-mcG2jr6QL0B83cNhsOCB2HXc
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAxMDE2MCBTYWx0ZWRfX1i7W4AfSu8RM
 8xS1PckL24Kqv0krQliwFplPErNyQ9oikDtc8KkQLanNMLkfKfAK7sO8/rPUMKJNlpWcAzVtMH5
 7exD70a+cmPUdb4zkv1L/uxTM3xXP3U=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-01_03,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 phishscore=0 malwarescore=0 spamscore=0
 adultscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608010160

Correct a few white-space issues, like double space after '=' or before
bracket '{' characters, which will be flagged by dt-check-style.  No
functional changes.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../devicetree/bindings/pci/brcm,stb-pcie.yaml       |  2 +-
 .../bindings/pci/renesas,pci-rcar-gen2.yaml          |  2 +-
 .../devicetree/bindings/pci/ti,am65-pci-ep.yaml      |  8 ++++----
 .../devicetree/bindings/pci/ti,am65-pci-host.yaml    | 12 ++++++------
 4 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/Documentation/devicetree/bindings/pci/brcm,stb-pcie.yaml b/Documentation/devicetree/bindings/pci/brcm,stb-pcie.yaml
index 812ef5957cfc..328b8156cd94 100644
--- a/Documentation/devicetree/bindings/pci/brcm,stb-pcie.yaml
+++ b/Documentation/devicetree/bindings/pci/brcm,stb-pcie.yaml
@@ -214,7 +214,7 @@ examples:
             dma-ranges = <0x42000000 0x1 0x00000000 0x0 0x40000000 0x0 0x80000000>,
                          <0x42000000 0x1 0x80000000 0x3 0x00000000 0x0 0x80000000>;
             brcm,enable-ssc;
-            brcm,scb-sizes =  <0x0000000080000000 0x0000000080000000>;
+            brcm,scb-sizes = <0x0000000080000000 0x0000000080000000>;
 
             /* PCIe bridge, Root Port */
             pci@0,0 {
diff --git a/Documentation/devicetree/bindings/pci/renesas,pci-rcar-gen2.yaml b/Documentation/devicetree/bindings/pci/renesas,pci-rcar-gen2.yaml
index 065b7508d288..1f0ab9ccd1dd 100644
--- a/Documentation/devicetree/bindings/pci/renesas,pci-rcar-gen2.yaml
+++ b/Documentation/devicetree/bindings/pci/renesas,pci-rcar-gen2.yaml
@@ -155,7 +155,7 @@ examples:
     #include <dt-bindings/clock/r8a7790-cpg-mssr.h>
     #include <dt-bindings/power/r8a7790-sysc.h>
 
-    pci@ee090000  {
+    pci@ee090000 {
         compatible = "renesas,pci-r8a7790", "renesas,pci-rcar-gen2";
         device_type = "pci";
         reg = <0xee090000 0xc00>,
diff --git a/Documentation/devicetree/bindings/pci/ti,am65-pci-ep.yaml b/Documentation/devicetree/bindings/pci/ti,am65-pci-ep.yaml
index 74195c1f5292..afde18c5a4fa 100644
--- a/Documentation/devicetree/bindings/pci/ti,am65-pci-ep.yaml
+++ b/Documentation/devicetree/bindings/pci/ti,am65-pci-ep.yaml
@@ -63,10 +63,10 @@ examples:
 
     pcie0_ep: pcie-ep@5500000 {
         compatible = "ti,am654-pcie-ep";
-        reg =  <0x5500000 0x1000>,
-               <0x5501000 0x1000>,
-               <0x10000000 0x8000000>,
-               <0x5506000 0x1000>;
+        reg = <0x5500000 0x1000>,
+              <0x5501000 0x1000>,
+              <0x10000000 0x8000000>,
+              <0x5506000 0x1000>;
         reg-names = "app", "dbics", "addr_space", "atu";
         power-domains = <&k3_pds 120 TI_SCI_PD_EXCLUSIVE>;
         ti,syscon-pcie-mode = <&scm_conf 0x4060>;
diff --git a/Documentation/devicetree/bindings/pci/ti,am65-pci-host.yaml b/Documentation/devicetree/bindings/pci/ti,am65-pci-host.yaml
index 98f6c7f1b1a6..db92125a2f2d 100644
--- a/Documentation/devicetree/bindings/pci/ti,am65-pci-host.yaml
+++ b/Documentation/devicetree/bindings/pci/ti,am65-pci-host.yaml
@@ -121,12 +121,12 @@ examples:
 
     pcie0_rc: pcie@5500000 {
         compatible = "ti,am654-pcie-rc";
-        reg =  <0x5500000 0x1000>,
-               <0x5501000 0x1000>,
-               <0x10000000 0x2000>,
-               <0x5506000 0x1000>,
-               <0x2900000 0x1000>,
-               <0x2908000 0x1000>;
+        reg = <0x5500000 0x1000>,
+              <0x5501000 0x1000>,
+              <0x10000000 0x2000>,
+              <0x5506000 0x1000>,
+              <0x2900000 0x1000>,
+              <0x2908000 0x1000>;
         reg-names = "app", "dbics", "config", "atu", "vmap_lp", "vmap_hp";
         power-domains = <&k3_pds 120 TI_SCI_PD_EXCLUSIVE>;
         #address-cells = <3>;
-- 
2.53.0

