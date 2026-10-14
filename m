Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95C6A4E534F
	for <linux-renesas-soc@vger.kernel.org>; Wed, 14 Oct 2026 12:37:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791981431; cv=none; b=CpaHPMQIOWZW03hIX06gz9UYeUKKr+ADlJKZHRhVLKuOvZq6urtXrLZqUNnXSb23W1oqj7HyTk0U4g17/rO6h1F6uzbzqoWfq1iSWMk6vFGup2ZFyzLpoZhf4E5fuXcXiSCcPkXFlOLIl1BnvLBZAJKEAbgkFKGuW7AFAWYnajg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791981431; c=relaxed/simple;
	bh=3JI92fChNel+xLl9nSTOo1s0KJ3h4nXbqoiyZakFteo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=R2irZRQy3QyRyrP0AEndx9ZRJshPDnOtPcGhmuN2X16nVMiY7H/C4XjGzEN4giALbFofS5wWTGP7Sj/0j/1y7GTX1ooQcfI2h7GPCdC/oOpMCi1Phw9Fx3k0dI+hPZ0/zPcU1I23rdgdkRZZF6Ke26rMuE5zpSG1MxN+OZ4zWvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oEaAZpzQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EKYuYTxl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oEaAZpzQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EKYuYTxl"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69EBbsLI2515922
	for <linux-renesas-soc@vger.kernel.org>; Wed, 14 Oct 2026 12:37:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=EVpFNB3CilehugVbDMWv6b
	Xoo9vCpK+FUU09DpaShRU=; b=oEaAZpzQnRbW6odHN3Vc0Ke0cjE66Hax9LD3Qd
	77MOTgT2nx+LnmVlaDJNhBJLk27an0caCqtbIi1+j33OpqUoKTX5lYgkyDUJi8zb
	QvRpqwR197fXX30KKofHac1+bP4u/Ki1gMHSHOjIr+Lnj7JZsN8U43WHkgNFCIze
	WO1jSCbCQ+eWwP6X0uqohJlLMagM3itjEpyfgnZ8CrygJEh2vBQBIMrLO+ChmgoW
	K807Zdtd1Vfm+dvHodUlUUAO+Fo7xRk/8E6OiN8cfqfvl+CoqFl0FKhgCQMf7bH7
	qry7cn3jG9NxoHZscZjQ7pEclEu2AqhAp0ZFSKn4twS+AhiQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ha4709hpc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Wed, 14 Oct 2026 12:37:08 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-934963b2bc0so789358285a.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 14 Oct 2026 05:37:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791981428; x=1792586228; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=EVpFNB3CilehugVbDMWv6bXoo9vCpK+FUU09DpaShRU=;
        b=EKYuYTxlbaS6rrZ5+CD8yMrb8yINDJYrLBd5zcUvVP8iEoM/Acb/TQmPjnanpeH+co
         Y5wmhH7dsPo/hvuSvvvbzJYo4QJN9UCI+2bfyQUPGivXSrUE5sqflE/3if53NK+7GqN2
         23sFLsQ9Wh8M8/Z8fzd/2FK5IZgj/feN1fxxinqM98yY3tqdvRA/3/sqWcgGssWlWgRG
         B+17QTxkOpQxzBu1D2wa5SyVA7YpLUBdCkHfgwxLtaI+zYj8YVavCIdWY7W1UkGt0lhq
         fI808tjE2ktwqp3orcG6jbmPHvqDIyLDfUahK1kezH33a2syYRRMjdAlD1uN1qivwFr4
         ArJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791981428; x=1792586228;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=EVpFNB3CilehugVbDMWv6bXoo9vCpK+FUU09DpaShRU=;
        b=zv9gdXHyJf5e0Ld+EvDztogbsrzs7kRP3Tcd/cHSe/coboXFxExJEXcJnQ6UrhVEiN
         fmiK9jkwuE4m4G08TjMnPEb0xkZ0Zcp/1l+VW+DwY/PScElZwzAnxnSvR4IJWWQ3vCxO
         av3YkMXLz4VaopKRiKBpHjNnLUbgJmwhiegQzkgnTft+cVJiYKit6GD/mVHMzl/1pjaZ
         Y64jxILcU8v1qXypKkKgFs8vjwnz/sJmnEntpgxI7ioyKHMVC4GUAJ3bHmZcHK5Bx1r0
         IcMf8lOKp5X3xmWNCfpfJ+KALYYxKFQnnVbJ5HW2ipidOuT9Cg3mXYhjruqWcE+Hlyrt
         psCg==
X-Forwarded-Encrypted: i=1; AKwUvBwznDimXHtLZxIk26vouNfhAsxBr5MQD6bQasKT/zM3XU9rn7DjtOdnCFxHpCxvA+oh7qKiKZ4UapRSV6sEmSSGxg==@vger.kernel.org
X-Gm-Message-State: AFq9FYIPBykMhOQxcmacNH/OFlC27Qsk+6+u3GQ2bob65YiE7qqipH3o
	pF4DPnFQ3wCMjK1vyiJERXHIBWRUwNB7MMQdjD+sfRrgqOV+0ZJS6PeQATwmkiB4WoHcCGHo4yM
	Y6sJv+31CxV+TiQC9dZ1bjPe5HCDECoiZ4kvBHn1C/LV+K1lefxUUe68vBRe0StgBB0paI6J3gQ
	==
X-Gm-Gg: AYBFou1TyZj59pdFc2Tp1Di2/uD9dvKnTWw7v1fDbHDk3P2uEzOErKFRoN/Z5qmQdjD
	VSJgPTtI2NSKAh5ZvI5cmLsU44SBx8xX7fplWJbkbP9+SZm1TWQw6zfMgs4qBciZAERF81874vJ
	TIa5SApyz00H9dNpyLvs6ZBcEkdkNmpe9/PIXQDfNDzCa4joR2tf0rKdDJiXZ6nghjNPeyeK/gy
	8XIO3ZfmxNkwgzRlsP6ECYtR3Oa99bRtCjpJ0IkFs9V9n0HhDW/mXSLFNGqGD9r9qSZHJDPyIiv
	FKLDp3i4SPUf690mDqgRpvY6J4xJJ9B88JNmJcYuu+mUyY6gD2POKGP8GNcXrjfo29AWUmyjFoA
	sdizmqWgMcpWyzHp2bdCnoNjMKc4+
X-Received: by 2002:a05:620a:8389:b0:93b:d79a:c463 with SMTP id af79cd13be357-93ebd26b5e0mr2523484485a.59.1791981427699;
        Wed, 14 Oct 2026 05:37:07 -0700 (PDT)
X-Received: by 2002:a05:620a:8389:b0:93b:d79a:c463 with SMTP id af79cd13be357-93ebd26b5e0mr2523450185a.59.1791981424148;
        Wed, 14 Oct 2026 05:37:04 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a19f318c31sm206122615e9.3.2026.10.14.05.37.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 05:37:03 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH net-next v16 0/7] net: stmmac: qcom-ethqos: add support for
 SCMI power domains
Date: Wed, 14 Oct 2026 14:36:39 +0200
Message-Id: <20261014-qcom-sa8255p-emac-v16-0-0266c2ead980@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFd3z2oC/3XTy26cMBQA0F+JWJfRfdi+dlb5j6oLG+wEKQMJT
 FGqaP69BqkFaewNEhgO9/ndLHEe4tI8P303c1yHZZjGfIPmx1PTvfnxNbZDnx80BKRBQLWf3XR
 tF29J6482Xn3XWmWAWPtOIzX5u485puFrR382Y7y1Y/y6Nb/yyduw3Kb5z/63Fffz3XUIBXfFF
 lomL65LGI2xL+/D6OfpMs2vO7fyfwKBpERwJkSLkeCIwYcHQh0EFrNbVSaSGGMArHTRPxD6TBS
 j0JkA7Dmy94ntYyLmIAhdiTCZUFYSgiVlML5My3L5/O3f86vXS75slc+AAUSqAdZ47lUg31t+B
 PZI5F8kBhhMCZIM9RkCZHAqSAWyJwixBNkMaUskIfcX0FYgd4aKEbkMddo6VlFMSlSBEE4ScXH
 iYJsXx0CB2Ho0NQoPylCxYbhNLwZJwemgMbkaRQcl5YrnhkKbZydg7BI5wBrFJwrLCW4LgeiSN
 c7FZGONUgflwBapbTFiR0hBlHjpa5Q+UZWybwsSLSVmIRAuzdT9fv8LafKE/q4EAAA=
X-Change-ID: 20250704-qcom-sa8255p-emac-8460235ac512
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
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
        Bartosz Golaszewski <brgl@kernel.org>,
        Eric Dumazet <edumazet@kernel.org>, Radu Rendec <radu@rendec.net>
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
        Sashiko <sashiko-bot@kernel.org>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7865;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=3JI92fChNel+xLl9nSTOo1s0KJ3h4nXbqoiyZakFteo=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqz3dh44xUDWD4gypAZq0VHb6gBzU8G5BnVE4C1
 /e3UOQADJ+JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCas93YQAKCRAFnS7L/zaE
 w1rgD/416+tDKuxenpypb4rL9y/Y7Z5Ro6iQ7GKyeMUxd7+uqf03H+7frSbWAU+kLIVZZu+e/ip
 cRvtQj+uBEjl9AsaFzDX7RWqgYB2KEaPMsbjzzKqrQYrH2+u3QZpx5F65j5a2HzopoCIBYupQJt
 4Pyxg0m5tTq6PSNVvB/tRKk6zDvwjPZ4KYOWJAEbRrPT0GfjMDbi7lvRwO3VEObjxoaOaToq1F3
 V5lN9MfgUfYDC6pX/YQjX1SJkKRmxOz0SgUQSgoN43OBN+lOkQdzAUnnq9usDPAw6RQW2vwbXEM
 huGteMONpZmYMVL6qz9N1eU9jEe0YR3Cqn+3gcnzhiPtzP71wSPBGC5HV4ysmdh+PHBPF++VpmU
 Zt2ejLLjwgbHEKR95etuZXzVbxE/1kEzIca31WpjmE5d/k+yu87SVXtx2r51nITrCIdAjTZsTHt
 62dsa4AuNlmZwdZrqxIEgA7IOlCMTPB2Br50JxL3g/dmH2EjYojeG8GikqKPai2PZlVAUN5fESr
 L+z8y9d0yOjcbPuTvs3i7MUEMlQwOZCrrvl9HYPrQi34U3Zhas2dOuDHPMi5tAemeY3QZWJS7zs
 IkUWljHunYnwT2K1vMKSNQT9DE8eNscl2KdUZnQjQNrTvrS5LRRFTx6O3/2m8Ne01oUxca5Zin9
 yxencD94IX2Gsjg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA1MCBTYWx0ZWRfX8d9subBAce5b
 8d1kynniiKKnoPek8+76EIm+0YD415oXP4dZULslEaVIjykczwKU+sJBkJJ0qZfZDB7cT5gQW0Q
 BFY4JqW5wZwP+MJN0xYpYtTo24iqHL1qSayxT9zqLIqavMY6x4hC9VZ0zqYOMWxUed9jD8AnWIL
 Asyj2sttTUa9xJBgHYQsFpDAE/aJm1NddLyM8fgjGqNdmJFOxxsADBIzXekMfy9YipZ3m0MKD3y
 voX7w8iNXSqVz+UrJQ2G5yKospI5FUKqOdipkB/JR0rP7YbI3oHaRAnZF4dBDyz0V2kO5hqzpk9
 M7oUfXththMGFeIoRobo9eInw5kQvXjPHTDg4abzywPdQq88Mal+8r6Vlr6lBiG9MQa2Gc+BKUN
 7x1FgLrLumEDV2fPE1E6d8ktdAJi+0z5XTMfw+mLOMNbmff37WcQDkxyQoUvvdyHb6RCymBx1FR
 8T7dJuVsMrumwRzsSYQ==
X-Proofpoint-GUID: NjukZJfyxnNg2s4fDqQQWcweqfV87x94
X-Authority-Analysis: v=2.4 cv=P6avFSAu c=1 sm=1 tr=0 ts=6acf7774 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=PHq6YzTAAAAA:8
 a=LD4EYYuP07UOpJRtIbAA:9 a=Wuut_rWLunZvJXiu:21 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=FO4_E8m0qiDe52t0p3_H:22 a=cvBusfyB2V15izCimMoJ:22
 a=ZKzU8r6zoKMcqsNulkmm:22
X-Proofpoint-ORIG-GUID: NjukZJfyxnNg2s4fDqQQWcweqfV87x94
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA1MCBTYWx0ZWRfX/+fE5uLG+Blo
 L2AZXK4fFavozrOp1O1JkZbV95HMZhS8RbMYjsZvsqFudr5Ft0WSAr4PDRZrVCzaFCPGcRLrvRS
 VUrq5ltOU5rGwkTnlrCVyIm585odmKE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 suspectscore=0 clxscore=1015 impostorscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610140050

Add support for the firmware-managed variant of the DesignWare MAC on
the sa8255p platform. This series contains new DT bindings and driver
changes required to support the MAC in the STMMAC driver.

It also reorganizes the ethqos code quite a bit to make the introduction
of power domains into the driver a bit easier on the eye.

The DTS changes will go in separately.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Changes in v16:
- Split out the SerDes PHY patches into their own series
- only set the serdes mode for actual serdes PHY modes
- reject non-serdes PHY modes on SCMI variants
- extend some comments to unconfuse sashiko
- add a fix for an issue reported by sashiko where the tick counter would
  get reprogrammed even without the CSR clock
- Link to v15: https://patch.msgid.link/20260923-qcom-sa8255p-emac-v15-0-e82f33720737@oss.qualcomm.com

Changes in v15:
- Squash patches 6 and 7 to avoid a potential hang-on-resume regression
  (Sashiko)
- Fix the AUTONEG_DISABLE early return path in forced mode (Sashiko)
- Fix Kconfig dependencies on generic power domains (Sashiko)
- Set the performance level back to 0 on unbind in the PHY driver
  (Sashiko)
- Use devm_pm_runtime_enable() where applicable
- Link to v14: https://patch.msgid.link/20260908-qcom-sa8255p-emac-v14-0-ec212b747a7d@oss.qualcomm.com

Changes in v14:
- let genpd's own runtime suspend/resume callbacks own the perf state entirely
  by calling dev_pm_genpd_set_performance_state() in set_mode()
  unconditionally in the sgmii PHY driver
- drop usleep_range() from the PHY driver when setting the state as the level
  setting is already synchronous
- add missing power-domains limits for ma35d1/k3-dwmac
- fix ordering of clearing the sgmii loopback
- configure the wrapper clocks synchronously in scmi setup
- Link to v13: https://patch.msgid.link/20260713-qcom-sa8255p-emac-v13-0-119f8699ef8e@oss.qualcomm.com

Changes in v13:
- Reapply OPP on speed change in the PHY driver
- Use linux/device-id/of.h instead of mod_devicetable.h
- Fix the "invalid PTP clock rate" warning on sa8255p
- Add commits necessary to allow correct link speed change with SCMI
- Link to v12: https://patch.msgid.link/20260706-qcom-sa8255p-emac-v12-0-e3ab1ecf2901@oss.qualcomm.com

Changes in v12:
- Drop the power-domain-names from the SGMII PHY DT bindings
- Add missing Kconfig dependency on PM for the new SGMII PHY driver
- Link to v11: https://patch.msgid.link/20260629-qcom-sa8255p-emac-v11-0-1b7fb95b51f9@oss.qualcomm.com

Changes in v11:
- Take a new approach: add a dedicated driver for the firmware-managed
  SGMII PHY and simplify changes made to the MAC driver
- Link to v10: https://patch.msgid.link/20260323-qcom-sa8255p-emac-v10-0-79302b238a16@oss.qualcomm.com

Changes in v10:
- Fix unit address in DT example
- Link to v9: https://patch.msgid.link/20260316-qcom-sa8255p-emac-v9-0-c58934e76ff2@oss.qualcomm.com

Changes in v9:
- Rebase on top of current linux-next again
- Link to v8: https://patch.msgid.link/20260311-qcom-sa8255p-emac-v8-0-58227bcf1018@oss.qualcomm.com

Changes in v8:
- Rebase on top of recent changes in linux-next which required an
  extensive rework
- Drop partial R-b tags
- Link to v7: https://patch.msgid.link/20260306-qcom-sa8255p-emac-v7-0-d6a3013094b7@oss.qualcomm.com

Changes in v7:
- Restored the correct authorship after learning git uses .mailmap for
  the --author switch
- Rebased on top of changes from Russell
- Fixed resource management issues in error paths
- Link to v6: https://lore.kernel.org/r/20260112-qcom-sa8255p-emac-v6-0-86a3d4b2ad83@oss.qualcomm.com

Changes in v6:
- Fix $id value in the bindings
- Drop patch 3/8 from the series
- Update init/exit callback signatures
- Link to v5: https://lore.kernel.org/r/20251107-qcom-sa8255p-emac-v5-0-01d3e3aaf388@linaro.org
- Link to v6: https://lore.kernel.org/r/20251219-qcom-sa8255p-emac-v6-0-487f1082461e@oss.qualcomm.com

Changes in v5:
- Name the DT binding document after the new compatbile
- Add missing space
- Make the power-domains limits stricter
- Link to v4: https://lore.kernel.org/r/20251104-qcom-sa8255p-emac-v4-0-f76660087cea@linaro.org

Changes in v4:
- Remove the phys property from the SCMI bindings
- Mark the power-domain-names property as required
- Set maxItems for power-domains to 1 for all existing bindings to
  maintain the current requirements after modifying the value in the
  top-level document
- Link to v3: https://lore.kernel.org/r/20251027-qcom-sa8255p-emac-v3-0-75767b9230ab@linaro.org

Changes in v3:
- Drop 'power' and 'perf' prefixes from power domain names
- Rebase on top of Russell's changes to dwmac
- Rebase on top of even more changes from Russell that are not yet
  in next (E1vB6ld-0000000BIPy-2Qi4@rmk-PC.armlinux.org.uk)
- Link to v2: https://lore.kernel.org/all/20251008-qcom-sa8255p-emac-v2-0-92bc29309fce@linaro.org/

Changes in v2:
- Fix the power-domains property in DT bindings
- Rework the DT bindings example
- Drop the DTS patch, it will go upstream separately
- Link to v1: https://lore.kernel.org/r/20250910-qcom-sa8255p-emac-v1-0-32a79cf1e668@linaro.org

---
Bartosz Golaszewski (7):
      net: stmmac: dwmac4: don't program the 1us tick counter without a CSR clock
      dt-bindings: net: qcom: document the ethqos device for SCMI-based systems
      net: stmmac: qcom-ethqos: set serdes mode before powerup
      net: stmmac: qcom-ethqos: update phy_mode to the resolved interface in mac_finish()
      net: stmmac: qcom-ethqos: reuse the address of ethqos_emac_driver_data
      net: stmmac: qcom-ethqos: factor out linux-level setup into a separate function
      net: stmmac: qcom-ethqos: add support for sa8255p

 .../bindings/net/allwinner,sun7i-a20-gmac.yaml     |   3 +
 .../bindings/net/altr,socfpga-stmmac.yaml          |   3 +
 .../bindings/net/amlogic,meson-dwmac.yaml          |   3 +
 .../devicetree/bindings/net/eswin,eic7700-eth.yaml |   3 +
 .../devicetree/bindings/net/intel,dwmac-plat.yaml  |   3 +
 .../bindings/net/loongson,ls1b-gmac.yaml           |   3 +
 .../bindings/net/loongson,ls1c-emac.yaml           |   3 +
 .../bindings/net/nuvoton,ma35d1-dwmac.yaml         |   3 +
 .../devicetree/bindings/net/nxp,dwmac-imx.yaml     |   3 +
 .../devicetree/bindings/net/nxp,lpc1850-dwmac.yaml |   3 +
 .../devicetree/bindings/net/nxp,s32-dwmac.yaml     |   3 +
 .../devicetree/bindings/net/qcom,ethqos.yaml       |   3 +
 .../bindings/net/qcom,sa8255p-ethqos.yaml          | 107 +++++++++
 .../devicetree/bindings/net/renesas,rzn1-gmac.yaml |   3 +
 .../bindings/net/renesas,rzv2h-gbeth.yaml          |   3 +
 .../devicetree/bindings/net/rockchip-dwmac.yaml    |   3 +
 .../devicetree/bindings/net/snps,dwmac.yaml        |   5 +-
 .../bindings/net/sophgo,cv1800b-dwmac.yaml         |   3 +
 .../bindings/net/sophgo,sg2044-dwmac.yaml          |   3 +
 .../devicetree/bindings/net/spacemit,k3-dwmac.yaml |   3 +
 .../bindings/net/starfive,jh7110-dwmac.yaml        |   3 +
 .../devicetree/bindings/net/stm32-dwmac.yaml       |   3 +
 .../devicetree/bindings/net/tesla,fsd-ethqos.yaml  |   3 +
 .../devicetree/bindings/net/thead,th1520-gmac.yaml |   3 +
 .../bindings/net/toshiba,visconti-dwmac.yaml       |   3 +
 MAINTAINERS                                        |   1 +
 .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 265 +++++++++++++++++----
 drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c  |   9 +-
 28 files changed, 402 insertions(+), 54 deletions(-)
---
base-commit: 07d73541fde12a6c05f230509142a66e6c8751eb
change-id: 20250704-qcom-sa8255p-emac-8460235ac512

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

