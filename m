Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F219A3C9438
	for <linux-renesas-soc@vger.kernel.org>; Sat,  1 Aug 2026 19:54:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785614078; cv=none; b=UiC3wXWTOBi1ORSiT8KqMr+HEm260q45Ihh3iE7Ehapp6aKr0OpvkY/qBlTCgYG3o1vz8bsNERU6owmiiuE7lo36I5SP2GhvK57byjp7S2VtrfmtB45+W/bII6ffLXmcn+Jm+fu+sgvQQJBxDHyJinSrOabs7sRF5r+ZJLOLL3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785614078; c=relaxed/simple;
	bh=+SKTiZ3DJpDnhBGULd4sVaUVBc0d5Z/9jPGH0XAffFA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tX88Oo5u1tirsPK+P1vPi32nVup7ufp/Gmagia5s5pX4ev41sJYWl9eUQNhf4JW9kagQC3P4G2aOlEeDTvd3pvH8cXQWlr115CtOiT20AZJ0BiYHR0GnrkXPr1WuYADS6oogs4gNms3Zfr28OoLfNwbQ/p8ZM7K328+yDRjCp80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z49ry31L; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LZcsFMyJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z49ry31L";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LZcsFMyJ"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 671IxhRa3738557
	for <linux-renesas-soc@vger.kernel.org>; Sat, 1 Aug 2026 19:54:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=SPPRZrtDb4yO5fESfxW514PoTShBn8ns2EG
	+MLlrXnA=; b=Z49ry31LPztTz5MhZCmR1MUuQFM51xCwzjbSsUR6BZfSi2/IDhX
	W9LoVKKmlhhE0an8RA1mh3ojNJaf6+OtjxpCyedHNhdlt4LxjGUy/XZXj8NL8xxU
	lcilXXUwcZ3YxpXzuCAacCQEPnKQqZm7Fd3DV2H7kR5R1u7gkweapcVtvi32gEEM
	N2Kj2IaXUbVA0/JuuhBkOdXp5yKGj24X5eS5GB6sHutlbxvC5aXJhOr/8RPVBlho
	hKsl2UlCRPmwsGCFcGiysTF77olmLJkMtO8ya+gc1wUupjl5gdMON7/8ky+SsMEI
	wqxIU/dQ8TYSvrJ58n+dfUwvbR9jHckVg0Q==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fs8u99khd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Sat, 01 Aug 2026 19:54:35 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92ea24a2db9so208971185a.0
        for <linux-renesas-soc@vger.kernel.org>; Sat, 01 Aug 2026 12:54:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785614075; x=1786218875; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SPPRZrtDb4yO5fESfxW514PoTShBn8ns2EG+MLlrXnA=;
        b=LZcsFMyJVt1g48qtvGo6eY5W/YBbQvFZbx7bz2JuCr/OLqZu8U6WhFS/bfLdNJ9vtt
         zjFBnQWZVaVQ0i3G+hucuyQuIILCwY6aLkA0vxMLq5Udyj97n1CcCU7xT6QVr4xzlrUP
         le9Iz/5umEM4R+i1VYD1Wqf3fJOdlHrq1gtnua7my5DsbUeh+UdKXG+BwPSj1RwMNEyD
         505pgsjTzmsd0xjviwzO3jFWPCMcnMsLt3yfEVkAOKAZOrSytoHEHsSFGflfejuiW59O
         Q8+dNfEbMT96YZAGLDhFMClar6L9RAt2867szjyk6W5UmBmwj2W5v9/Ip3GjTvRuykT2
         NIYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785614075; x=1786218875;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SPPRZrtDb4yO5fESfxW514PoTShBn8ns2EG+MLlrXnA=;
        b=cZ1SVLETv6EBnRIBukY0H0i/eOgC2usO9xgdhJxLMeA3/uxDWu4ZJmu6FPq1Z1biRS
         xX1Mbw6OopvtMiXN0vbEOak2cWnW7e7cq1gnCkkv5y9DMf6OidKwi3NqIaxoapAuETCw
         gyCTxP8CX3y0/Ki0qxwzTo+CFkjhjlhDH6yIgozv31P3E6c9RnsKNwtaTNg4D1hClZRd
         JS51XNisqaZVjrwpaGbpp8L93kTDXQ5zDNmSB60pKnLy7581R66Q0rbTVVAulEqKyE6F
         S5jDB5oGDurnQfpgu5qMwbE1gJCmbWBm62qqafq8kRTr+cPkB4Bo8DwPfXUBC0l5OEkU
         BgfA==
X-Forwarded-Encrypted: i=1; AHgh+RrNfnxm6qVU/ZMFREiE1d5EXY0mg6WZ6u7dfZx4+9ZMwBAwx6Ws4F4it7wXjpvRqGLN8Z007hA2ROgbyKH5WMV4fg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0TMkymxpngFCrsXnENheRUoOOgkCDURnNr2fJBpacX2ZgnPEL
	wh0lvfgoCk1VJQGafyfhVrZ5tIao2JYq5ffc1zit2zfaq7CAmHRpn6A4rnkpbGmCNXgRNN2AVhx
	Q9K9yvl4d7cAQmthhLrrhcNk9tKmtYKvKNF6NkT/mBYwNf29sCS0GNbyDx9tBsAQ6JXkiQPDWXg
	==
X-Gm-Gg: AR+sD11dAnXvMEYiQwR2sszVRxwVJNr4Vz+Q7lDTdAE950m6EpLvmw8Zyq5kJp/FAKg
	mpkIw3Ta/dyRI0QMDsvtiiGvaUEx3RNX6PFqjNfs9XQkIbp6mlEh1JJiRSHnazcvtlFxfQB5Nsh
	IjYghBqU95J4XZfgQ6pbgQVzE5/UYN/TW7al2ikcbmiiAxu9ul2ERiuyauAtOiL95siV8FSIobr
	mkizwNs+ljJcUsbsbcgD73lMTKv/59uoOySxDIWlaX2pZ/rFlQjBliwAjDsAiZ8wCIfqlqnTl5w
	ehw3wsDE6KUUrNsS+QqMcltAD6kU6d+rFEA0lhgP8nP9cb1DAgV5EKGapvJFnutFY6NR8C9MslK
	9qDn/soVymFn/UEb9
X-Received: by 2002:a05:620a:4549:b0:927:59bf:46ca with SMTP id af79cd13be357-934a0aa676emr883838985a.40.1785614074846;
        Sat, 01 Aug 2026 12:54:34 -0700 (PDT)
X-Received: by 2002:a05:620a:4549:b0:927:59bf:46ca with SMTP id af79cd13be357-934a0aa676emr883838185a.40.1785614074404;
        Sat, 01 Aug 2026 12:54:34 -0700 (PDT)
Received: from quoll ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49807b9441csm74616955e9.4.2026.08.01.12.54.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 12:54:32 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Igor Prusov <ivprusov@salutedevices.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        John Madieu <john.madieu.xa@bp.renesas.com>,
        linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] ASoC: dt-bindings: Correct white-space style
Date: Sat,  1 Aug 2026 21:54:26 +0200
Message-ID: <20260801195425.234120-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1769; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=+SKTiZ3DJpDnhBGULd4sVaUVBc0d5Z/9jPGH0XAffFA=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqbk7x8JD0ocq7yPTibW9I0XxL1BrJIyy+gOlzD
 NSZX+dVzvqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCam5O8QAKCRDBN2bmhouD
 12l9D/9vdLrcnTK8bOMcbsBBZRg80oMM/ej83hLCNFR04e302VUqcygYd3qdXXe/QOxOulC8qHe
 ddThx8z36UwYyEVVcEla/UA7e59NOZwFExn0EpAhdYB0wCSN8zm7Vf4domLByB+13vC8CsNs6xl
 sVdqyc4PYdaYFJN9BzSaR0AVb00LO+Jki98+6KHgEyDA2XYGncHbNXWBciEcpb6GR9j3DS0eBnE
 xJiUE7o+ytkyWWtITMNycfBY6N2DFLCCAXLQEztSTlTUvE3vrdKmXvEhra/Js19rCCFGZIQhfr+
 X3AUaebgIQsHY+MxZNDH+tzvgdto0O81Aksoauuv8DNMIdLX+ZhekFqh0lYXGFojkcNSiF9ooLq
 xedQMlRP0oACmdMvsrpQAxHWc+r2zP1N0dLZOUdxjWZoBkuZk3CyPo7zCheUkpXpPrq8o9fYzUs
 9KM3rmi2/Dg19QH1DJXCXdSlOewuy89Aodakd/oDnXIsIpq1Ur2owaGukPgsWbUqUOmO/x0T/Kx
 hRVd/TxXFvt2UVbt/GHScQvhE9Qt7uADm2NMDd2ve6h+6iSYsAbUoo2CoaVbmY8+FEY67697cFz
 Pd9z4wA1CCRUmz6lWpx6YM2pCRBwBmujnvdudlbtGT73WoYsP3iUl5v6PKnWUrefVSZXKk+zmEk Kh1c0HB2bXn4G2Q==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: g60UY-1QpoLCHzSJ59LbDv0-npy0Rqh1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAxMDE2MCBTYWx0ZWRfXwTOKGInQLLdb
 V9wZK+8RxYVMn0aYTXYUlykOLsnHwbOz9ZXpkcOrnGAGNSnYmmruUr/iV9Am7nP9mGUVAzJUNtC
 xbTIpd4bGJ0XzSd+cdgSRFfxCj4sdswX3R7umRzbj5sAW1rIC/mfdewZPBnKxw81G5k6onD/ZW/
 dvhZ4e1DqZSV7+iE0hhNEsGJzVA/iINaemlB5JNOXl7z9sS2irfYHwubB0Ouqmk7fGHGRY5Qv/g
 5S/CueAFeILguXdoXvsDOBsWjOxAD6RVmF4XtzgoxPfwFIJoOJ+WAT+rItRTwpevGAiL3AoYreG
 c4liLRrVdKbl9pJ2BDmBWJlTI5vJcplqJBa/IELsVmAUCPBFe6X/N04rRlywKrPmubwNOpCgXr1
 GK7qVSFO024ufqCEoR0klZLdgXlHiLkkM1c7i5djJywPFPpDitnk8FSNiZ3U2z9eBpAifdwRoF3
 6ePi8dy4C9wV4QNW0vQ==
X-Authority-Analysis: v=2.4 cv=LsCiDHdc c=1 sm=1 tr=0 ts=6a6e4efb cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=cRXCb4fqzGmq9334JhgA:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAxMDE2MCBTYWx0ZWRfX+tmbRb142jgr
 In/0Ec81ayM046NOjm8amiZQxt+PBWRj9/o2L+3kQmlKlSc2Estvzo5dfScCEG0D3CE5Wj8GGKN
 4gm2RumHQb06UjYp0K37E6X0s/3MCD0=
X-Proofpoint-ORIG-GUID: g60UY-1QpoLCHzSJ59LbDv0-npy0Rqh1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-01_03,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 spamscore=0 adultscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608010160

Correct a few white-space issues, like double space after '=' character,
which will be flagged by dt-check-style.  No functional changes.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../devicetree/bindings/sound/neofidelity,ntp8918.yaml          | 2 +-
 .../devicetree/bindings/sound/renesas,r9a09g047-sound.yaml      | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/neofidelity,ntp8918.yaml b/Documentation/devicetree/bindings/sound/neofidelity,ntp8918.yaml
index 6946177e391a..99b739595ebf 100644
--- a/Documentation/devicetree/bindings/sound/neofidelity,ntp8918.yaml
+++ b/Documentation/devicetree/bindings/sound/neofidelity,ntp8918.yaml
@@ -66,7 +66,7 @@ examples:
             #sound-dai-cells = <0>;
             reg = <0x2a>;
             clocks = <&clkc 150>, <&clkc 151>, <&clkc 152>;
-            clock-names =  "wck", "scl", "bck";
+            clock-names = "wck", "scl", "bck";
             reset-gpios = <&gpio 5 GPIO_ACTIVE_LOW>;
         };
     };
diff --git a/Documentation/devicetree/bindings/sound/renesas,r9a09g047-sound.yaml b/Documentation/devicetree/bindings/sound/renesas,r9a09g047-sound.yaml
index d7fa16554698..213c1c40b6f0 100644
--- a/Documentation/devicetree/bindings/sound/renesas,r9a09g047-sound.yaml
+++ b/Documentation/devicetree/bindings/sound/renesas,r9a09g047-sound.yaml
@@ -793,7 +793,7 @@ examples:
             bitclock-master = <&rsnd_endpoint0>;
             frame-master = <&rsnd_endpoint0>;
             playback = <&ssi3>, <&src1>, <&dvc1>;
-            capture  = <&ssi4>, <&src0>, <&dvc0>;
+            capture = <&ssi4>, <&src0>, <&dvc0>;
           };
         };
       };
-- 
2.53.0

