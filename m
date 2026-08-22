Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD6D33A2576
	for <linux-renesas-soc@vger.kernel.org>; Sat, 22 Aug 2026 07:58:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787385510; cv=none; b=YrNgVzOUcwxsh8oIYuCj0Tvuy0BW/rqAOFsMJ6bcmH+8ZDHmEoxzFlw59K9WqeAkhbW3chXVXGPC1YGRCkky92FpcNIV5oK8kTAtRDRNk6g9tdHaUt2Qhb7YD1fQLLMr0aCAogM1JkNgWZlj+OZMVXexRVaxknQ0rs9J0XZAiYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787385510; c=relaxed/simple;
	bh=vwCBNK1bl4ij18Ar336Y3MkFLyn+CO8Fgt3g6r1qJKU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cSANhOM/2MMP5OF0UDH9UKHzdg/MGXkIDYrBocMk847j6dCl339hwfd9yXnPKnGIfPSMC79z5tB5awaLKUWBrHDh/jto6cg14gmqeJChlbbkwojv5rkhvvx4U/bCU2Wbx99VUJN8Tvpt81wn58zKqHxs6EOEOU8nzyrpsJe1+9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fIUS4yLo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jufUxiDE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fIUS4yLo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jufUxiDE"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67M4laej3948075
	for <linux-renesas-soc@vger.kernel.org>; Sat, 22 Aug 2026 07:58:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=VoqP2JHaWoYbQB/AZ5yPJ6DaaxDHO+rqk3N
	aVMDcunM=; b=fIUS4yLo+qgzHCSuVD6XglmQJNynr9sttNvw+nX8VQhAWT6Waux
	cYalpdwkNtWUO4b43fyIbJdrOroKh5zwvVJp3SV+7AREH7gIokBGyioCTI/uYvX3
	hm6DLx0uMXGb3TGF8jlhZyZzft0XYdtGMtdL/s7Uyoh5xxSFjlboQkQ90Kcq51rP
	XGCJb47asie4R6YajRPh852bSXFk3W8zhUijQD0TY0/uTsjMRNpDD1eq+NC0tm4r
	OHC6T25RnG/iOfoNAiV0oLDwe7xeG8MdSlVSHBb3M262EcylUSrbt22GrFBBgv4r
	zAfFpyRFPf2e2+TM/fgXnkIs3iHq24x1CMg==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g7528gbgu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Sat, 22 Aug 2026 07:58:25 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-97c777e5694so976223241.2
        for <linux-renesas-soc@vger.kernel.org>; Sat, 22 Aug 2026 00:58:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787385504; x=1787990304; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VoqP2JHaWoYbQB/AZ5yPJ6DaaxDHO+rqk3NaVMDcunM=;
        b=jufUxiDEf6vk8fM5HvYGgKdFWJsPSyp3DPzNcPf/a8pTOzhqZNcYPah7KHkpAb3Iak
         Ia1VRVUy8iJkK3JBSCdu0y6FIoqAIUAEsJ5AhsUb0qAe7kIHmcPhdUD1JwXXEiQ0EzHW
         GYa0LuEBtClz4Ap5pu33OHlf2/p9YiQCWsf4BbOK/ppGZASaO4e9anbJoOhbii8nr235
         niGsYyyzpDrj3bMFhCUI4JKZ6oaYNqqyGvrFnL1rPEHbvjGajmikDkBTuuhZ5KKtCOe0
         QafVSeFAKZvsTra1PguWGpSRbApBQ7yWnW+hExW0AkR4rAO9A0xSDptwMcZ3DhKou9T2
         ByRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787385504; x=1787990304;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VoqP2JHaWoYbQB/AZ5yPJ6DaaxDHO+rqk3NaVMDcunM=;
        b=D7K62/Ahh1M7uUiMW8gC2KT+pP/QGloK66dvcl7RMxh9wTaE9D5W1AFXvvH1DA/C7i
         2R9xFIJ/ICCAa+btkwegg1AsMHgzc1XLr1JIPDQIRIj53A4pcug+xO7NtmktwuRcK0z8
         O1OcqhrSFGBleZC+uYVkFBishx32hqjWhOTwlhzMh0O5UOeZVJahOczZQGoOZHrnRwZw
         fwtBAiBGK/zrNHZ7ZhDNg5lbsGC82OxnfwEwOv6L5trb4au+qsXxA++dzd3ibt3WOZbg
         7Dr2t/Jl9rC9OkwsplIFSxNzKiZQ5Vq6PVhAM37FefeqZQIi/UHidYPz7nIpru/LWdWr
         jQdQ==
X-Forwarded-Encrypted: i=1; AHgh+RoEyJyNOLfxQGgcsVhZM23COw0Rd3OEk/MVM/s9KvbrXk7+0kXWiO5fY4MYGEG89FlZIwmlkeaH2PzvY1gGlLdH0w==@vger.kernel.org
X-Gm-Message-State: AFuF++kq69Kq+VfVdCnF4qiendseMdc9dGLvfu5Vx4hqLgExK7B1zNot
	wLL1mQMINt28S3Kzbbb6tSDlX5SgeWD1lFIrTEqUoLIMBKLw796MwlQC0nWPu82OrTjfw2zqpAF
	Ru40k80pYpAmxpyXTVd68z27DU2En9dEF91YEoaiAROPSJpYrCwEa29gD7N7780fVfCPosqgzlA
	==
X-Gm-Gg: AR+sD11JYTgpzf0U0o89qyaHnNywx5gs5hwbHLusJKnyKFaNe0D/R9dI+YQNXW0qGDB
	m+HX7doVm+OoT7B1Ip1YDYViSqSsddFO4ywL4z9lZpuqWodKjZoWzqsIRougqfOeMW/py3kvDVf
	Or0FIsGOKJP4fQAzzIb/p3J39bDgzxxI0WaS7bhfscjv36l8d8A62J3Zh/PjUGr2qLkKumqdu+9
	g7yIDwu0WG+51rgjnfPg1Q6UVEL/AFjwY9JAskoHmaFn+Im5ZQpmENsLwGAynfl0TjnlPCe22/2
	a4/8MJt35mxtDYvS/y4Ik9SKoouJL1ZF9+1gdA1eNu9vcyAPA+Cg5xlFJ3/TqVcazIWSvRHqqCA
	Ig0Y04uzJf6zfTbE=
X-Received: by 2002:a05:6102:a53:b0:77b:4caf:bb49 with SMTP id ada2fe7eead31-77b4cafc038mr3201993137.13.1787385503892;
        Sat, 22 Aug 2026 00:58:23 -0700 (PDT)
X-Received: by 2002:a05:6102:a53:b0:77b:4caf:bb49 with SMTP id ada2fe7eead31-77b4cafc038mr3201972137.13.1787385503165;
        Sat, 22 Aug 2026 00:58:23 -0700 (PDT)
Received: from quoll ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a3feec9f4asm10862939a12.3.2026.08.22.00.58.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Aug 2026 00:58:21 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] arm64: dts: renesas: Use hyphens in node names
Date: Sat, 22 Aug 2026 09:58:14 +0200
Message-ID: <20260822075813.199336-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=50848; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=vwCBNK1bl4ij18Ar336Y3MkFLyn+CO8Fgt3g6r1qJKU=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqiVaVTLWqGS82Qj1TYMVXwFOXtK5htg8gNX90V
 7EqJ9G0SB+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaolWlQAKCRDBN2bmhouD
 164BD/sHGL/Vd2MoES2QVwCZmLGkBPnNUJrLwCOP96LRvRLYymWdm5k4+pdzw5ND/3y767aAzIB
 wPpZgUS9yGoL/NZGSN4fTrbdsV6S1zKuuZh9Wlk8cw9eUFWnijSIkn+IuxFuGWAG4IbxuywR6IZ
 H7vOqZcciRBkoCyrQ7UdouYhHAYG/3BjhVCw6YdjJHOhj6IUXgsJV5SITP65ikLx9Rk+Tpl+XsU
 +7bR73p+xThL6s+thXqlWXW5FG/H1d5Ymsr5qZExH47U5n/6WZxya83INWM8SgERMJjtBs9bg0a
 UIjR9eYIdfWdWoLiBZ1t0C3xrMd0Aa1GGZtXO/oFnp9rtabxy6T2cRkxn3JNM/0Mi0+MQ0txiVu
 U6mYjUSKgOWgFSyk3+wf9CUipm8hQRfTszbVg+r0wuCiQIkyNDOr8BxnuYJXadcGxPtCTSh+vJp
 oZDKmotD8mRKM6MF2Lb3+JuF9kJdDe/XNjP9KtUI3UT+1IiU5zpuG4Rz3E8HxYD4o/N4VIkK+Ox
 jf7l2hjgUCTKEfQAvcrvAhrWSTAluaOSxSUod+hhuP6otVAWky4UD1XG1fwjkZBUSCjiwKVY4+g
 ZUThJEOFDKmzlPc7jS0HbQekWYCDlBAls/BUJEs9n8x2I5AeDC/2gQ+XDD33slPvx3tZYK37NPD jPW4LGX6LMdH64A==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=DsJmPm/+ c=1 sm=1 tr=0 ts=6a8956a1 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=j__AoUMnPY3PUBQU_BgA:9 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-GUID: kMOrAj9e18eWTaftj42HI1CUi1DAVuzX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIyMDA2MiBTYWx0ZWRfX/48UbUeMQxxi
 b3xiXORo1WRuHEhiVMzjYTKmVB8uMH5mYocbOv6OxlDEofhgGoMlo+us4v+ydHJblyWLT4SHotD
 t4hMTvPTjnVm5EKEp1FLweb+/qGFHXBXd2VBYqs7jH8FSuoj84fTGHrlDifL1az+8XS3o1Jzaa8
 sj2yphTklSn0uBtB0GRbKCO9mlvZ/VL1oUJm7aCz+MaAI09HcO+0qxLGF25UdwNeHsuKUXySMlp
 /m5TS7UevUd+58dQiCfv1+ZglRAzwFosjN4BvjzJNISTPo5ZrUyAxTbfHxpBEDALGzFdCiCixSJ
 B6grcCIgbg5yqCp80SLvBZm2EPrRO6cqEnuyGP5pAZkTIY1Oq/vrlHru2I9Vd0t6CH5il1lMgHB
 zQ6rITpn+Q0Ef3zJF3/Ls7DNjoE5+VmVnuiHYAsn5VEkPTsEysRsut0J+LbYslJNPlhoVdKafPq
 kiu+ml0NaR4+rJbO4AQ==
X-Proofpoint-ORIG-GUID: kMOrAj9e18eWTaftj42HI1CUi1DAVuzX
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIyMDA2MiBTYWx0ZWRfXzkd4xV1ntGgA
 ncqOpEtZhi2Jdxz4nLE0h73STNJ1yurIUhzc0GDxwprmHEJMe+VOjFOpwOtsnYOfylg3fw9uHln
 4ghnH4I3Ye+X7U29E6U5uEMgqvIqmJo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-22_02,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 clxscore=1015 adultscore=0 suspectscore=0
 malwarescore=0 bulkscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608220062

DTS coding style encourages to use hyphens instead of underscores in
node names. DTC W=2 warns about underscores. Improve existing code
because apparently people copy it instead of following DTS coding style
for new submissions.

Semi-manual validation by checking if no new nodes appeared:

  $ for i in dts-old/*/*dtb dts-old/*/*/*dtb; do echo $i; fdtdump ${i} > ${i}.fdt ; fdtdump dts-new/${i#dts-old/} > dts-new/${i#dts-old/}.fdt ; diff -ubB ${i}.fdt dts-new/${i#dts-old/}.fdt ; done | grep -v ' {'

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../aistarvision-mipi-adapter-2.1.dtsi        |  2 +-
 .../dts/renesas/beacon-renesom-baseboard.dtsi |  6 +++---
 .../boot/dts/renesas/beacon-renesom-som.dtsi  | 10 +++++-----
 .../arm64/boot/dts/renesas/condor-common.dtsi |  2 +-
 arch/arm64/boot/dts/renesas/draak.dtsi        |  2 +-
 arch/arm64/boot/dts/renesas/ebisu.dtsi        |  6 +++---
 .../boot/dts/renesas/gray-hawk-single.dtsi    |  8 ++++----
 .../arm64/boot/dts/renesas/hihope-common.dtsi |  4 ++--
 arch/arm64/boot/dts/renesas/hihope-rev2.dtsi  |  8 ++++----
 arch/arm64/boot/dts/renesas/hihope-rev4.dtsi  |  4 ++--
 .../boot/dts/renesas/hihope-rzg2-ex.dtsi      |  4 ++--
 arch/arm64/boot/dts/renesas/r8a774a1.dtsi     | 14 ++++++-------
 arch/arm64/boot/dts/renesas/r8a774b1.dtsi     | 12 +++++------
 .../boot/dts/renesas/r8a774c0-cat874.dts      |  4 ++--
 arch/arm64/boot/dts/renesas/r8a774c0.dtsi     | 12 +++++------
 arch/arm64/boot/dts/renesas/r8a774e1.dtsi     | 14 ++++++-------
 arch/arm64/boot/dts/renesas/r8a77951.dtsi     | 14 ++++++-------
 arch/arm64/boot/dts/renesas/r8a77960.dtsi     | 14 ++++++-------
 arch/arm64/boot/dts/renesas/r8a77961.dtsi     | 14 ++++++-------
 arch/arm64/boot/dts/renesas/r8a77965.dtsi     | 12 +++++------
 .../arm64/boot/dts/renesas/r8a77970-eagle.dts |  2 +-
 .../arm64/boot/dts/renesas/r8a77970-v3msk.dts |  2 +-
 arch/arm64/boot/dts/renesas/r8a77970.dtsi     |  2 +-
 .../arm64/boot/dts/renesas/r8a77980-v3hsk.dts |  2 +-
 arch/arm64/boot/dts/renesas/r8a77980.dtsi     |  4 ++--
 arch/arm64/boot/dts/renesas/r8a77990.dtsi     | 10 +++++-----
 arch/arm64/boot/dts/renesas/r8a77995.dtsi     |  6 +++---
 .../boot/dts/renesas/r8a779a0-falcon-cpu.dtsi |  2 +-
 .../boot/dts/renesas/r8a779a0-falcon.dts      |  4 ++--
 arch/arm64/boot/dts/renesas/r8a779a0.dtsi     |  2 +-
 .../boot/dts/renesas/r8a779f0-spider-cpu.dtsi |  2 +-
 arch/arm64/boot/dts/renesas/r8a779f0.dtsi     |  2 +-
 arch/arm64/boot/dts/renesas/r8a779f4-s4sk.dts |  2 +-
 arch/arm64/boot/dts/renesas/r8a779g0.dtsi     |  4 ++--
 arch/arm64/boot/dts/renesas/r8a779h0.dtsi     |  2 +-
 .../arm64/boot/dts/renesas/r8a779md-geist.dts | 10 +++++-----
 .../dts/renesas/r9a09g057h44-rzv2h-evk.dts    |  6 +++---
 .../dts/renesas/rzg2l-smarc-pinfunction.dtsi  | 16 +++++++--------
 .../boot/dts/renesas/rzg2l-smarc-som.dtsi     | 20 +++++++++----------
 arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi  |  2 +-
 .../dts/renesas/rzg2lc-smarc-pinfunction.dtsi | 16 +++++++--------
 .../boot/dts/renesas/rzg2lc-smarc-som.dtsi    | 20 +++++++++----------
 arch/arm64/boot/dts/renesas/rzg2lc-smarc.dtsi |  2 +-
 .../dts/renesas/rzg2ul-smarc-pinfunction.dtsi | 16 +++++++--------
 .../boot/dts/renesas/rzg2ul-smarc-som.dtsi    | 20 +++++++++----------
 .../boot/dts/renesas/rzg3s-smarc-som.dtsi     |  4 ++--
 .../boot/dts/renesas/salvator-common.dtsi     | 12 +++++------
 arch/arm64/boot/dts/renesas/salvator-xs.dtsi  |  2 +-
 arch/arm64/boot/dts/renesas/ulcb-kf.dtsi      |  2 +-
 arch/arm64/boot/dts/renesas/ulcb.dtsi         |  8 ++++----
 .../dts/renesas/white-hawk-cpu-common.dtsi    |  6 +++---
 51 files changed, 188 insertions(+), 188 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/aistarvision-mipi-adapter-2.1.dtsi b/arch/arm64/boot/dts/renesas/aistarvision-mipi-adapter-2.1.dtsi
index 529388f6bf2b..c5db0516ae83 100644
--- a/arch/arm64/boot/dts/renesas/aistarvision-mipi-adapter-2.1.dtsi
+++ b/arch/arm64/boot/dts/renesas/aistarvision-mipi-adapter-2.1.dtsi
@@ -54,7 +54,7 @@ imx219_vddl_1v2: 1p2v {
 		regulator-always-on;
 	};
 
-	osc25250_clk: osc25250_clk {
+	osc25250_clk: clock-24000000 {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
 		clock-frequency = <24000000>;
diff --git a/arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi b/arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi
index 62ab0a3776e7..963253866d71 100644
--- a/arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi
+++ b/arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi
@@ -142,7 +142,7 @@ reg_cam1: regulator-cam1 {
 		startup-delay-us = <100000>;
 	};
 
-	sound_card {
+	sound-card {
 		compatible = "audio-graph-card";
 		label = "rcar-sound";
 		dais = <&rsnd_port0>, <&rsnd_port1>;
@@ -505,7 +505,7 @@ sdhi0_pins: sd0 {
 		power-source = <3300>;
 	};
 
-	sdhi0_pins_uhs: sd0_uhs {
+	sdhi0_pins_uhs: sd0-uhs {
 		groups = "sdhi0_data4", "sdhi0_ctrl";
 		function = "sdhi0";
 		power-source = <1800>;
@@ -516,7 +516,7 @@ sound_pins: sound {
 		function = "ssi";
 	};
 
-	sound_clk_pins: sound_clk {
+	sound_clk_pins: sound-clk {
 		groups = "audio_clk_a_a", "audio_clk_b_a";
 		function = "audio_clk";
 	};
diff --git a/arch/arm64/boot/dts/renesas/beacon-renesom-som.dtsi b/arch/arm64/boot/dts/renesas/beacon-renesom-som.dtsi
index f8442b6a85a7..f21f7fdd27d1 100644
--- a/arch/arm64/boot/dts/renesas/beacon-renesom-som.dtsi
+++ b/arch/arm64/boot/dts/renesas/beacon-renesom-som.dtsi
@@ -13,7 +13,7 @@ memory@48000000 {
 		reg = <0x0 0x48000000 0x0 0x78000000>;
 	};
 
-	osc_32k: osc_32k {
+	osc_32k: clock-32768 {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
 		clock-frequency = <32768>;
@@ -38,7 +38,7 @@ reg_3p3v: regulator-3p3v {
 		regulator-always-on;
 	};
 
-	wlan_pwrseq: wlan_pwrseq {
+	wlan_pwrseq: wlan-pwrseq {
 		compatible = "mmc-pwrseq-simple";
 		reset-gpios = <&pca9654 1 GPIO_ACTIVE_LOW>;
 		clocks = <&osc_32k>;
@@ -209,12 +209,12 @@ mux {
 			function = "avb";
 		};
 
-		pins_mdio {
+		pins-mdio {
 			groups = "avb_mdio";
 			drive-strength = <24>;
 		};
 
-		pins_mii_tx {
+		pins-mii-tx {
 			pins = "PIN_AVB_TX_CTL", "PIN_AVB_TXC", "PIN_AVB_TD0",
 			       "PIN_AVB_TD1", "PIN_AVB_TD2", "PIN_AVB_TD3";
 			drive-strength = <12>;
@@ -251,7 +251,7 @@ scif5_pins: scif5 {
 		function = "scif5";
 	};
 
-	scif_clk_pins: scif_clk {
+	scif_clk_pins: scif-clk {
 		groups = "scif_clk_a";
 		function = "scif_clk";
 	};
diff --git a/arch/arm64/boot/dts/renesas/condor-common.dtsi b/arch/arm64/boot/dts/renesas/condor-common.dtsi
index 9d55509b00b1..953c5bb491ec 100644
--- a/arch/arm64/boot/dts/renesas/condor-common.dtsi
+++ b/arch/arm64/boot/dts/renesas/condor-common.dtsi
@@ -472,7 +472,7 @@ scif0_pins: scif0 {
 		function = "scif0";
 	};
 
-	scif_clk_pins: scif_clk {
+	scif_clk_pins: scif-clk {
 		groups = "scif_clk_b";
 		function = "scif_clk";
 	};
diff --git a/arch/arm64/boot/dts/renesas/draak.dtsi b/arch/arm64/boot/dts/renesas/draak.dtsi
index f2f25fe5d778..33046295f2d6 100644
--- a/arch/arm64/boot/dts/renesas/draak.dtsi
+++ b/arch/arm64/boot/dts/renesas/draak.dtsi
@@ -561,7 +561,7 @@ sdhi2_pins: sd2 {
 		power-source = <1800>;
 	};
 
-	sdhi2_pins_uhs: sd2_uhs {
+	sdhi2_pins_uhs: sd2-uhs {
 		groups = "mmc_data8", "mmc_ctrl";
 		function = "mmc";
 		power-source = <1800>;
diff --git a/arch/arm64/boot/dts/renesas/ebisu.dtsi b/arch/arm64/boot/dts/renesas/ebisu.dtsi
index 4b3775afcb01..842e1a57e228 100644
--- a/arch/arm64/boot/dts/renesas/ebisu.dtsi
+++ b/arch/arm64/boot/dts/renesas/ebisu.dtsi
@@ -674,7 +674,7 @@ sdhi0_pins: sd0 {
 		power-source = <3300>;
 	};
 
-	sdhi0_pins_uhs: sd0_uhs {
+	sdhi0_pins_uhs: sd0-uhs {
 		groups = "sdhi0_data4", "sdhi0_ctrl";
 		function = "sdhi0";
 		power-source = <1800>;
@@ -686,7 +686,7 @@ sdhi1_pins: sd1 {
 		power-source = <3300>;
 	};
 
-	sdhi1_pins_uhs: sd1_uhs {
+	sdhi1_pins_uhs: sd1-uhs {
 		groups = "sdhi1_data4", "sdhi1_ctrl";
 		function = "sdhi1";
 		power-source = <1800>;
@@ -698,7 +698,7 @@ sdhi3_pins: sd3 {
 		power-source = <1800>;
 	};
 
-	sound_clk_pins: sound_clk {
+	sound_clk_pins: sound-clk {
 		groups = "audio_clk_a", "audio_clk_b_a", "audio_clk_c_a",
 			 "audio_clkout_a", "audio_clkout1_a";
 		function = "audio_clk";
diff --git a/arch/arm64/boot/dts/renesas/gray-hawk-single.dtsi b/arch/arm64/boot/dts/renesas/gray-hawk-single.dtsi
index 274493720b14..42ee6778f2e0 100644
--- a/arch/arm64/boot/dts/renesas/gray-hawk-single.dtsi
+++ b/arch/arm64/boot/dts/renesas/gray-hawk-single.dtsi
@@ -595,12 +595,12 @@ mux {
 			function = "avb0";
 		};
 
-		pins_mdio {
+		pins-mdio {
 			groups = "avb0_mdio";
 			drive-strength = <21>;
 		};
 
-		pins_mii {
+		pins-mii {
 			groups = "avb0_rgmii";
 			drive-strength = <21>;
 		};
@@ -696,7 +696,7 @@ i2c3_pins: i2c3 {
 		function = "i2c3";
 	};
 
-	irq0_pins: irq0_pins {
+	irq0_pins: irq0-pins {
 		groups = "intc_ex_irq0_a";
 		function = "intc_ex";
 	};
@@ -727,7 +727,7 @@ scif_clk2_pins: scif-clk2 {
 		function = "scif_clk2";
 	};
 
-	sound_clk_pins: sound_clk {
+	sound_clk_pins: sound-clk {
 		groups = "audio_clkin", "audio_clkout";
 		function = "audio_clk";
 	};
diff --git a/arch/arm64/boot/dts/renesas/hihope-common.dtsi b/arch/arm64/boot/dts/renesas/hihope-common.dtsi
index 4e78139d52f6..1999f97e0e60 100644
--- a/arch/arm64/boot/dts/renesas/hihope-common.dtsi
+++ b/arch/arm64/boot/dts/renesas/hihope-common.dtsi
@@ -229,7 +229,7 @@ scif2_pins: scif2 {
 		function = "scif2";
 	};
 
-	scif_clk_pins: scif_clk {
+	scif_clk_pins: scif-clk {
 		groups = "scif_clk_a";
 		function = "scif_clk";
 	};
@@ -240,7 +240,7 @@ sdhi0_pins: sd0 {
 		power-source = <3300>;
 	};
 
-	sdhi0_pins_uhs: sd0_uhs {
+	sdhi0_pins_uhs: sd0-uhs {
 		groups = "sdhi0_data4", "sdhi0_ctrl";
 		function = "sdhi0";
 		power-source = <1800>;
diff --git a/arch/arm64/boot/dts/renesas/hihope-rev2.dtsi b/arch/arm64/boot/dts/renesas/hihope-rev2.dtsi
index 25c55b32aafe..99ade271844a 100644
--- a/arch/arm64/boot/dts/renesas/hihope-rev2.dtsi
+++ b/arch/arm64/boot/dts/renesas/hihope-rev2.dtsi
@@ -13,14 +13,14 @@ / {
 	leds {
 		compatible = "gpio-leds";
 
-		bt_active_led {
+		bt-active-led {
 			label = "blue:bt";
 			gpios = <&gpio7  0 GPIO_ACTIVE_HIGH>;
 			linux,default-trigger = "hci0-power";
 			default-state = "off";
 		};
 
-		wlan_active_led {
+		wlan-active-led {
 			label = "yellow:wlan";
 			gpios = <&gpio7  1 GPIO_ACTIVE_HIGH>;
 			linux,default-trigger = "phy0tx";
@@ -28,7 +28,7 @@ wlan_active_led {
 		};
 	};
 
-	wlan_en_reg: regulator-wlan_en {
+	wlan_en_reg: regulator-wlan-en {
 		compatible = "regulator-fixed";
 		regulator-name = "wlan-en-regulator";
 		regulator-min-microvolt = <1800000>;
@@ -57,7 +57,7 @@ gpio_expander: gpio@20 {
 };
 
 &pfc {
-	sound_clk_pins: sound_clk {
+	sound_clk_pins: sound-clk {
 		groups = "audio_clk_a_a";
 		function = "audio_clk";
 	};
diff --git a/arch/arm64/boot/dts/renesas/hihope-rev4.dtsi b/arch/arm64/boot/dts/renesas/hihope-rev4.dtsi
index acce3c0452f4..a26a985ec48b 100644
--- a/arch/arm64/boot/dts/renesas/hihope-rev4.dtsi
+++ b/arch/arm64/boot/dts/renesas/hihope-rev4.dtsi
@@ -20,7 +20,7 @@ audio_clkout: audio-clkout {
 		clock-frequency = <12288000>;
 	};
 
-	wlan_en_reg: regulator-wlan_en {
+	wlan_en_reg: regulator-wlan-en {
 		compatible = "regulator-fixed";
 		regulator-name = "wlan-en-regulator";
 		regulator-min-microvolt = <1800000>;
@@ -68,7 +68,7 @@ i2c2_pins: i2c2 {
 		function = "i2c2";
 	};
 
-	sound_clk_pins: sound_clk {
+	sound_clk_pins: sound-clk {
 		groups = "audio_clk_a_a", "audio_clk_b_a", "audio_clkout_a";
 		function = "audio_clk";
 	};
diff --git a/arch/arm64/boot/dts/renesas/hihope-rzg2-ex.dtsi b/arch/arm64/boot/dts/renesas/hihope-rzg2-ex.dtsi
index 83b6c04274ac..9d596baf5a16 100644
--- a/arch/arm64/boot/dts/renesas/hihope-rzg2-ex.dtsi
+++ b/arch/arm64/boot/dts/renesas/hihope-rzg2-ex.dtsi
@@ -57,12 +57,12 @@ mux {
 			function = "avb";
 		};
 
-		pins_mdio {
+		pins-mdio {
 			groups = "avb_mdio";
 			drive-strength = <24>;
 		};
 
-		pins_mii_tx {
+		pins-mii-tx {
 			pins = "PIN_AVB_TX_CTL", "PIN_AVB_TXC", "PIN_AVB_TD0",
 			       "PIN_AVB_TD1", "PIN_AVB_TD2", "PIN_AVB_TD3";
 			drive-strength = <12>;
diff --git a/arch/arm64/boot/dts/renesas/r8a774a1.dtsi b/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
index e66d86db6e6c..5d500505b3ff 100644
--- a/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
@@ -21,19 +21,19 @@ / {
 	 * clocks by default.
 	 * Boards that provide audio clocks should override them.
 	 */
-	audio_clk_a: audio_clk_a {
+	audio_clk_a: audio-clk-a {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
 		clock-frequency = <0>;
 	};
 
-	audio_clk_b: audio_clk_b {
+	audio_clk_b: audio-clk-b {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
 		clock-frequency = <0>;
 	};
 
-	audio_clk_c: audio_clk_c {
+	audio_clk_c: audio-clk-c {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
 		clock-frequency = <0>;
@@ -228,13 +228,13 @@ extalr_clk: extalr {
 	};
 
 	/* External PCIe clock - can be overridden by the board */
-	pcie_bus_clk: pcie_bus {
+	pcie_bus_clk: pcie-bus {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
 		clock-frequency = <0>;
 	};
 
-	pmu_a53 {
+	pmu-a53 {
 		compatible = "arm,cortex-a53-pmu";
 		interrupts = <GIC_SPI 84 IRQ_TYPE_LEVEL_HIGH>,
 			     <GIC_SPI 85 IRQ_TYPE_LEVEL_HIGH>,
@@ -243,7 +243,7 @@ pmu_a53 {
 		interrupt-affinity = <&a53_0>, <&a53_1>, <&a53_2>, <&a53_3>;
 	};
 
-	pmu_a57 {
+	pmu-a57 {
 		compatible = "arm,cortex-a57-pmu";
 		interrupts= <GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>,
 			    <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>;
@@ -2877,7 +2877,7 @@ usb3s0_clk: usb3s0 {
 		clock-frequency = <0>;
 	};
 
-	usb_extal_clk: usb_extal {
+	usb_extal_clk: usb-extal {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
 		clock-frequency = <0>;
diff --git a/arch/arm64/boot/dts/renesas/r8a774b1.dtsi b/arch/arm64/boot/dts/renesas/r8a774b1.dtsi
index 62c6703917db..e0d593c49a86 100644
--- a/arch/arm64/boot/dts/renesas/r8a774b1.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a774b1.dtsi
@@ -21,19 +21,19 @@ / {
 	 * clocks by default.
 	 * Boards that provide audio clocks should override them.
 	 */
-	audio_clk_a: audio_clk_a {
+	audio_clk_a: audio-clk-a {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
 		clock-frequency = <0>;
 	};
 
-	audio_clk_b: audio_clk_b {
+	audio_clk_b: audio-clk-b {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
 		clock-frequency = <0>;
 	};
 
-	audio_clk_c: audio_clk_c {
+	audio_clk_c: audio-clk-c {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
 		clock-frequency = <0>;
@@ -121,13 +121,13 @@ extalr_clk: extalr {
 	};
 
 	/* External PCIe clock - can be overridden by the board */
-	pcie_bus_clk: pcie_bus {
+	pcie_bus_clk: pcie-bus {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
 		clock-frequency = <0>;
 	};
 
-	pmu_a57 {
+	pmu-a57 {
 		compatible = "arm,cortex-a57-pmu";
 		interrupts = <GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>,
 			     <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>;
@@ -2748,7 +2748,7 @@ usb3s0_clk: usb3s0 {
 		clock-frequency = <0>;
 	};
 
-	usb_extal_clk: usb_extal {
+	usb_extal_clk: usb-extal {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
 		clock-frequency = <0>;
diff --git a/arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts b/arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts
index 57a281fc4977..4be3f82a0460 100644
--- a/arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts
+++ b/arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts
@@ -322,7 +322,7 @@ sdhi0_pins: sd0 {
 		power-source = <3300>;
 	};
 
-	sdhi0_pins_uhs: sd0_uhs {
+	sdhi0_pins_uhs: sd0-uhs {
 		groups = "sdhi0_data4", "sdhi0_ctrl";
 		function = "sdhi0";
 		power-source = <1800>;
@@ -334,7 +334,7 @@ sdhi3_pins: sd3 {
 		power-source = <1800>;
 	};
 
-	sound_clk_pins: sound_clk {
+	sound_clk_pins: sound-clk {
 		groups = "audio_clkout1_a";
 		function = "audio_clk";
 	};
diff --git a/arch/arm64/boot/dts/renesas/r8a774c0.dtsi b/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
index 3858f4328e96..37313f525a93 100644
--- a/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
@@ -20,19 +20,19 @@ / {
 	 * clocks by default.
 	 * Boards that provide audio clocks should override them.
 	 */
-	audio_clk_a: audio_clk_a {
+	audio_clk_a: audio-clk-a {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
 		clock-frequency = <0>;
 	};
 
-	audio_clk_b: audio_clk_b {
+	audio_clk_b: audio-clk-b {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
 		clock-frequency = <0>;
 	};
 
-	audio_clk_c: audio_clk_c {
+	audio_clk_c: audio-clk-c {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
 		clock-frequency = <0>;
@@ -112,13 +112,13 @@ extal_clk: extal {
 	};
 
 	/* External PCIe clock - can be overridden by the board */
-	pcie_bus_clk: pcie_bus {
+	pcie_bus_clk: pcie-bus {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
 		clock-frequency = <0>;
 	};
 
-	pmu_a53 {
+	pmu-a53 {
 		compatible = "arm,cortex-a53-pmu";
 		interrupts= <GIC_SPI 84 IRQ_TYPE_LEVEL_HIGH>,
 			    <GIC_SPI 85 IRQ_TYPE_LEVEL_HIGH>;
@@ -2014,7 +2014,7 @@ usb3s0_clk: usb3s0 {
 		clock-frequency = <0>;
 	};
 
-	usb_extal_clk: usb_extal {
+	usb_extal_clk: usb-extal {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
 		clock-frequency = <0>;
diff --git a/arch/arm64/boot/dts/renesas/r8a774e1.dtsi b/arch/arm64/boot/dts/renesas/r8a774e1.dtsi
index 0ae9bb72d2dd..335b94d3fec7 100644
--- a/arch/arm64/boot/dts/renesas/r8a774e1.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a774e1.dtsi
@@ -21,19 +21,19 @@ / {
 	 * clocks by default.
 	 * Boards that provide audio clocks should override them.
 	 */
-	audio_clk_a: audio_clk_a {
+	audio_clk_a: audio-clk-a {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
 		clock-frequency = <0>;
 	};
 
-	audio_clk_b: audio_clk_b {
+	audio_clk_b: audio-clk-b {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
 		clock-frequency = <0>;
 	};
 
-	audio_clk_c: audio_clk_c {
+	audio_clk_c: audio-clk-c {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
 		clock-frequency = <0>;
@@ -290,13 +290,13 @@ extalr_clk: extalr {
 	};
 
 	/* External PCIe clock - can be overridden by the board */
-	pcie_bus_clk: pcie_bus {
+	pcie_bus_clk: pcie-bus {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
 		clock-frequency = <0>;
 	};
 
-	pmu_a53 {
+	pmu-a53 {
 		compatible = "arm,cortex-a53-pmu";
 		interrupts = <GIC_SPI 84 IRQ_TYPE_LEVEL_HIGH>,
 			     <GIC_SPI 85 IRQ_TYPE_LEVEL_HIGH>,
@@ -305,7 +305,7 @@ pmu_a53 {
 		interrupt-affinity = <&a53_0>, <&a53_1>, <&a53_2>, <&a53_3>;
 	};
 
-	pmu_a57 {
+	pmu-a57 {
 		compatible = "arm,cortex-a57-pmu";
 		interrupts = <GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>,
 			     <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>,
@@ -3011,7 +3011,7 @@ usb3s0_clk: usb3s0 {
 		clock-frequency = <0>;
 	};
 
-	usb_extal_clk: usb_extal {
+	usb_extal_clk: usb-extal {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
 		clock-frequency = <0>;
diff --git a/arch/arm64/boot/dts/renesas/r8a77951.dtsi b/arch/arm64/boot/dts/renesas/r8a77951.dtsi
index 59a0f2e1479d..a08b1609bbe6 100644
--- a/arch/arm64/boot/dts/renesas/r8a77951.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77951.dtsi
@@ -25,19 +25,19 @@ / {
 	 * clocks by default.
 	 * Boards that provide audio clocks should override them.
 	 */
-	audio_clk_a: audio_clk_a {
+	audio_clk_a: audio-clk-a {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
 		clock-frequency = <0>;
 	};
 
-	audio_clk_b: audio_clk_b {
+	audio_clk_b: audio-clk-b {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
 		clock-frequency = <0>;
 	};
 
-	audio_clk_c: audio_clk_c {
+	audio_clk_c: audio-clk-c {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
 		clock-frequency = <0>;
@@ -305,13 +305,13 @@ extalr_clk: extalr {
 	};
 
 	/* External PCIe clock - can be overridden by the board */
-	pcie_bus_clk: pcie_bus {
+	pcie_bus_clk: pcie-bus {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
 		clock-frequency = <0>;
 	};
 
-	pmu_a53 {
+	pmu-a53 {
 		compatible = "arm,cortex-a53-pmu";
 		interrupts = <GIC_SPI 84 IRQ_TYPE_LEVEL_HIGH>,
 			     <GIC_SPI 85 IRQ_TYPE_LEVEL_HIGH>,
@@ -323,7 +323,7 @@ pmu_a53 {
 				     <&a53_3>;
 	};
 
-	pmu_a57 {
+	pmu-a57 {
 		compatible = "arm,cortex-a57-pmu";
 		interrupts = <GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>,
 			     <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>,
@@ -3520,7 +3520,7 @@ usb3s0_clk: usb3s0 {
 		clock-frequency = <0>;
 	};
 
-	usb_extal_clk: usb_extal {
+	usb_extal_clk: usb-extal {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
 		clock-frequency = <0>;
diff --git a/arch/arm64/boot/dts/renesas/r8a77960.dtsi b/arch/arm64/boot/dts/renesas/r8a77960.dtsi
index 4f9989b5e77a..cdbb7f9556fb 100644
--- a/arch/arm64/boot/dts/renesas/r8a77960.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77960.dtsi
@@ -20,19 +20,19 @@ / {
 	 * clocks by default.
 	 * Boards that provide audio clocks should override them.
 	 */
-	audio_clk_a: audio_clk_a {
+	audio_clk_a: audio-clk-a {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
 		clock-frequency = <0>;
 	};
 
-	audio_clk_b: audio_clk_b {
+	audio_clk_b: audio-clk-b {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
 		clock-frequency = <0>;
 	};
 
-	audio_clk_c: audio_clk_c {
+	audio_clk_c: audio-clk-c {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
 		clock-frequency = <0>;
@@ -277,13 +277,13 @@ extalr_clk: extalr {
 	};
 
 	/* External PCIe clock - can be overridden by the board */
-	pcie_bus_clk: pcie_bus {
+	pcie_bus_clk: pcie-bus {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
 		clock-frequency = <0>;
 	};
 
-	pmu_a53 {
+	pmu-a53 {
 		compatible = "arm,cortex-a53-pmu";
 		interrupts = <GIC_SPI 84 IRQ_TYPE_LEVEL_HIGH>,
 			     <GIC_SPI 85 IRQ_TYPE_LEVEL_HIGH>,
@@ -292,7 +292,7 @@ pmu_a53 {
 		interrupt-affinity = <&a53_0>, <&a53_1>, <&a53_2>, <&a53_3>;
 	};
 
-	pmu_a57 {
+	pmu-a57 {
 		compatible = "arm,cortex-a57-pmu";
 		interrupts = <GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>,
 			     <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>;
@@ -3135,7 +3135,7 @@ usb3s0_clk: usb3s0 {
 		clock-frequency = <0>;
 	};
 
-	usb_extal_clk: usb_extal {
+	usb_extal_clk: usb-extal {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
 		clock-frequency = <0>;
diff --git a/arch/arm64/boot/dts/renesas/r8a77961.dtsi b/arch/arm64/boot/dts/renesas/r8a77961.dtsi
index ad4491ba948f..38f34c5c9f65 100644
--- a/arch/arm64/boot/dts/renesas/r8a77961.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77961.dtsi
@@ -20,19 +20,19 @@ / {
 	 * clocks by default.
 	 * Boards that provide audio clocks should override them.
 	 */
-	audio_clk_a: audio_clk_a {
+	audio_clk_a: audio-clk-a {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
 		clock-frequency = <0>;
 	};
 
-	audio_clk_b: audio_clk_b {
+	audio_clk_b: audio-clk-b {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
 		clock-frequency = <0>;
 	};
 
-	audio_clk_c: audio_clk_c {
+	audio_clk_c: audio-clk-c {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
 		clock-frequency = <0>;
@@ -277,13 +277,13 @@ extalr_clk: extalr {
 	};
 
 	/* External PCIe clock - can be overridden by the board */
-	pcie_bus_clk: pcie_bus {
+	pcie_bus_clk: pcie-bus {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
 		clock-frequency = <0>;
 	};
 
-	pmu_a53 {
+	pmu-a53 {
 		compatible = "arm,cortex-a53-pmu";
 		interrupts = <GIC_SPI 84 IRQ_TYPE_LEVEL_HIGH>,
 			     <GIC_SPI 85 IRQ_TYPE_LEVEL_HIGH>,
@@ -292,7 +292,7 @@ pmu_a53 {
 		interrupt-affinity = <&a53_0>, <&a53_1>, <&a53_2>, <&a53_3>;
 	};
 
-	pmu_a57 {
+	pmu-a57 {
 		compatible = "arm,cortex-a57-pmu";
 		interrupts = <GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>,
 			     <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>;
@@ -2956,7 +2956,7 @@ usb3s0_clk: usb3s0 {
 		clock-frequency = <0>;
 	};
 
-	usb_extal_clk: usb_extal {
+	usb_extal_clk: usb-extal {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
 		clock-frequency = <0>;
diff --git a/arch/arm64/boot/dts/renesas/r8a77965.dtsi b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
index 70708f5cf746..52376c6de208 100644
--- a/arch/arm64/boot/dts/renesas/r8a77965.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
@@ -25,19 +25,19 @@ / {
 	 * clocks by default.
 	 * Boards that provide audio clocks should override them.
 	 */
-	audio_clk_a: audio_clk_a {
+	audio_clk_a: audio-clk-a {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
 		clock-frequency = <0>;
 	};
 
-	audio_clk_b: audio_clk_b {
+	audio_clk_b: audio-clk-b {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
 		clock-frequency = <0>;
 	};
 
-	audio_clk_c: audio_clk_c {
+	audio_clk_c: audio-clk-c {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
 		clock-frequency = <0>;
@@ -156,13 +156,13 @@ extalr_clk: extalr {
 	};
 
 	/* External PCIe clock - can be overridden by the board */
-	pcie_bus_clk: pcie_bus {
+	pcie_bus_clk: pcie-bus {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
 		clock-frequency = <0>;
 	};
 
-	pmu_a57 {
+	pmu-a57 {
 		compatible = "arm,cortex-a57-pmu";
 		interrupts = <GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>,
 			     <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>;
@@ -2964,7 +2964,7 @@ usb3s0_clk: usb3s0 {
 		clock-frequency = <0>;
 	};
 
-	usb_extal_clk: usb_extal {
+	usb_extal_clk: usb-extal {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
 		clock-frequency = <0>;
diff --git a/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts b/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts
index a2ad79ddf73d..be0ee054fc5f 100644
--- a/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts
+++ b/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts
@@ -335,7 +335,7 @@ scif0_pins: scif0 {
 		function = "scif0";
 	};
 
-	scif_clk_pins: scif_clk {
+	scif_clk_pins: scif-clk {
 		groups = "scif_clk_b";
 		function = "scif_clk";
 	};
diff --git a/arch/arm64/boot/dts/renesas/r8a77970-v3msk.dts b/arch/arm64/boot/dts/renesas/r8a77970-v3msk.dts
index 10c9a2e9ed18..f184fa93d2a4 100644
--- a/arch/arm64/boot/dts/renesas/r8a77970-v3msk.dts
+++ b/arch/arm64/boot/dts/renesas/r8a77970-v3msk.dts
@@ -215,7 +215,7 @@ i2c0_pins: i2c0 {
 		function = "i2c0";
 	};
 
-	mmc_pins: mmc_3_3v {
+	mmc_pins: mmc-3-3v {
 		groups = "mmc_data8", "mmc_ctrl";
 		function = "mmc";
 		power-source = <3300>;
diff --git a/arch/arm64/boot/dts/renesas/r8a77970.dtsi b/arch/arm64/boot/dts/renesas/r8a77970.dtsi
index f7f1f280fa0b..3eb519b61fca 100644
--- a/arch/arm64/boot/dts/renesas/r8a77970.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77970.dtsi
@@ -72,7 +72,7 @@ extalr_clk: extalr {
 		bootph-all;
 	};
 
-	pmu_a53 {
+	pmu-a53 {
 		compatible = "arm,cortex-a53-pmu";
 		interrupts = <GIC_SPI 84 IRQ_TYPE_LEVEL_HIGH>,
 			     <GIC_SPI 85 IRQ_TYPE_LEVEL_HIGH>;
diff --git a/arch/arm64/boot/dts/renesas/r8a77980-v3hsk.dts b/arch/arm64/boot/dts/renesas/r8a77980-v3hsk.dts
index 52462e61b719..32b5ea7d1dc5 100644
--- a/arch/arm64/boot/dts/renesas/r8a77980-v3hsk.dts
+++ b/arch/arm64/boot/dts/renesas/r8a77980-v3hsk.dts
@@ -207,7 +207,7 @@ scif0_pins: scif0 {
 		function = "scif0";
 	};
 
-	scif_clk_pins: scif_clk {
+	scif_clk_pins: scif-clk {
 		groups = "scif_clk_b";
 		function = "scif_clk";
 	};
diff --git a/arch/arm64/boot/dts/renesas/r8a77980.dtsi b/arch/arm64/boot/dts/renesas/r8a77980.dtsi
index 514dafe34478..1df6d3db046c 100644
--- a/arch/arm64/boot/dts/renesas/r8a77980.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77980.dtsi
@@ -93,13 +93,13 @@ extalr_clk: extalr {
 	};
 
 	/* External PCIe clock - can be overridden by the board */
-	pcie_bus_clk: pcie_bus {
+	pcie_bus_clk: pcie-bus {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
 		clock-frequency = <0>;
 	};
 
-	pmu_a53 {
+	pmu-a53 {
 		compatible = "arm,cortex-a53-pmu";
 		interrupts = <GIC_SPI 84 IRQ_TYPE_LEVEL_HIGH>,
 			     <GIC_SPI 85 IRQ_TYPE_LEVEL_HIGH>,
diff --git a/arch/arm64/boot/dts/renesas/r8a77990.dtsi b/arch/arm64/boot/dts/renesas/r8a77990.dtsi
index fadb5f4effcf..0e9b837a6e5b 100644
--- a/arch/arm64/boot/dts/renesas/r8a77990.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77990.dtsi
@@ -20,19 +20,19 @@ / {
 	 * clocks by default.
 	 * Boards that provide audio clocks should override them.
 	 */
-	audio_clk_a: audio_clk_a {
+	audio_clk_a: audio-clk-a {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
 		clock-frequency = <0>;
 	};
 
-	audio_clk_b: audio_clk_b {
+	audio_clk_b: audio-clk-b {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
 		clock-frequency = <0>;
 	};
 
-	audio_clk_c: audio_clk_c {
+	audio_clk_c: audio-clk-c {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
 		clock-frequency = <0>;
@@ -127,13 +127,13 @@ extal_clk: extal {
 	};
 
 	/* External PCIe clock - can be overridden by the board */
-	pcie_bus_clk: pcie_bus {
+	pcie_bus_clk: pcie-bus {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
 		clock-frequency = <0>;
 	};
 
-	pmu_a53 {
+	pmu-a53 {
 		compatible = "arm,cortex-a53-pmu";
 		interrupts = <GIC_SPI 84 IRQ_TYPE_LEVEL_HIGH>,
 			     <GIC_SPI 85 IRQ_TYPE_LEVEL_HIGH>;
diff --git a/arch/arm64/boot/dts/renesas/r8a77995.dtsi b/arch/arm64/boot/dts/renesas/r8a77995.dtsi
index 522a49db0258..a20fff95407b 100644
--- a/arch/arm64/boot/dts/renesas/r8a77995.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77995.dtsi
@@ -21,13 +21,13 @@ / {
 	 * clocks by default.
 	 * Boards that provide audio clocks should override them.
 	 */
-	audio_clk_a: audio_clk_a {
+	audio_clk_a: audio-clk-a {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
 		clock-frequency = <0>;
 	};
 
-	audio_clk_b: audio_clk_b {
+	audio_clk_b: audio-clk-b {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
 		clock-frequency = <0>;
@@ -69,7 +69,7 @@ extal_clk: extal {
 		bootph-all;
 	};
 
-	pmu_a53 {
+	pmu-a53 {
 		compatible = "arm,cortex-a53-pmu";
 		interrupts = <GIC_SPI 84 IRQ_TYPE_LEVEL_HIGH>;
 	};
diff --git a/arch/arm64/boot/dts/renesas/r8a779a0-falcon-cpu.dtsi b/arch/arm64/boot/dts/renesas/r8a779a0-falcon-cpu.dtsi
index 0916fd57d1f1..2675f48d8fd0 100644
--- a/arch/arm64/boot/dts/renesas/r8a779a0-falcon-cpu.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779a0-falcon-cpu.dtsi
@@ -306,7 +306,7 @@ scif0_pins: scif0 {
 		function = "scif0";
 	};
 
-	scif_clk_pins: scif_clk {
+	scif_clk_pins: scif-clk {
 		groups = "scif_clk";
 		function = "scif_clk";
 	};
diff --git a/arch/arm64/boot/dts/renesas/r8a779a0-falcon.dts b/arch/arm64/boot/dts/renesas/r8a779a0-falcon.dts
index ea5dcee73658..5708e395a226 100644
--- a/arch/arm64/boot/dts/renesas/r8a779a0-falcon.dts
+++ b/arch/arm64/boot/dts/renesas/r8a779a0-falcon.dts
@@ -73,12 +73,12 @@ mux {
 			function = "avb0";
 		};
 
-		pins_mdio {
+		pins-mdio {
 			groups = "avb0_mdio";
 			drive-strength = <21>;
 		};
 
-		pins_mii {
+		pins-mii {
 			groups = "avb0_rgmii";
 			drive-strength = <21>;
 		};
diff --git a/arch/arm64/boot/dts/renesas/r8a779a0.dtsi b/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
index 0483a5d0714a..38f35c81981b 100644
--- a/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
@@ -59,7 +59,7 @@ extalr_clk: extalr {
 		bootph-all;
 	};
 
-	pmu_a76 {
+	pmu-a76 {
 		compatible = "arm,cortex-a76-pmu";
 		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
 	};
diff --git a/arch/arm64/boot/dts/renesas/r8a779f0-spider-cpu.dtsi b/arch/arm64/boot/dts/renesas/r8a779f0-spider-cpu.dtsi
index 1781bb79a619..0cfbff532f42 100644
--- a/arch/arm64/boot/dts/renesas/r8a779f0-spider-cpu.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779f0-spider-cpu.dtsi
@@ -206,7 +206,7 @@ scif0_pins: scif0 {
 		function = "scif0";
 	};
 
-	scif_clk_pins: scif_clk {
+	scif_clk_pins: scif-clk {
 		groups = "scif_clk";
 		function = "scif_clk";
 	};
diff --git a/arch/arm64/boot/dts/renesas/r8a779f0.dtsi b/arch/arm64/boot/dts/renesas/r8a779f0.dtsi
index cbb161c863ac..69c247b7f0e2 100644
--- a/arch/arm64/boot/dts/renesas/r8a779f0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779f0.dtsi
@@ -279,7 +279,7 @@ pcie1_clkref: pcie1-clkref {
 		clock-frequency = <0>;
 	};
 
-	pmu_a55 {
+	pmu-a55 {
 		compatible = "arm,cortex-a55-pmu";
 		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
 	};
diff --git a/arch/arm64/boot/dts/renesas/r8a779f4-s4sk.dts b/arch/arm64/boot/dts/renesas/r8a779f4-s4sk.dts
index 67b18f2bffbd..a0fd7f3e1ba9 100644
--- a/arch/arm64/boot/dts/renesas/r8a779f4-s4sk.dts
+++ b/arch/arm64/boot/dts/renesas/r8a779f4-s4sk.dts
@@ -151,7 +151,7 @@ i2c5_pins: i2c5 {
 		function = "i2c5";
 	};
 
-	scif_clk_pins: scif_clk {
+	scif_clk_pins: scif-clk {
 		groups = "scif_clk";
 		function = "scif_clk";
 	};
diff --git a/arch/arm64/boot/dts/renesas/r8a779g0.dtsi b/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
index 8a291447b904..90a4d7972dca 100644
--- a/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
@@ -16,7 +16,7 @@ / {
 	interrupt-parent = <&gic>;
 
 	/* External Audio clock - to be overridden by boards that provide it */
-	audio_clkin: audio_clkin {
+	audio_clkin: audio-clkin {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
 		clock-frequency = <0>;
@@ -192,7 +192,7 @@ pcie1_clkref: pcie1-clkref {
 		clock-frequency = <0>;
 	};
 
-	pmu_a76 {
+	pmu-a76 {
 		compatible = "arm,cortex-a76-pmu";
 		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
 	};
diff --git a/arch/arm64/boot/dts/renesas/r8a779h0.dtsi b/arch/arm64/boot/dts/renesas/r8a779h0.dtsi
index 74bc4c4854ec..aca6ffc68c30 100644
--- a/arch/arm64/boot/dts/renesas/r8a779h0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779h0.dtsi
@@ -16,7 +16,7 @@ / {
 	interrupt-parent = <&gic>;
 
 	/* External Audio clock - to be overridden by boards that provide it */
-	audio_clkin: audio_clkin {
+	audio_clkin: audio-clkin {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
 		clock-frequency = <0>;
diff --git a/arch/arm64/boot/dts/renesas/r8a779md-geist.dts b/arch/arm64/boot/dts/renesas/r8a779md-geist.dts
index 0e4724336e73..c5a49244f020 100644
--- a/arch/arm64/boot/dts/renesas/r8a779md-geist.dts
+++ b/arch/arm64/boot/dts/renesas/r8a779md-geist.dts
@@ -460,12 +460,12 @@ mux {
 			function = "avb";
 		};
 
-		pins_mdio {
+		pins-mdio {
 			groups = "avb_mdio";
 			drive-strength = <24>;
 		};
 
-		pins_mii_tx {
+		pins-mii-tx {
 			pins = "PIN_AVB_TX_CTL", "PIN_AVB_TXC", "PIN_AVB_TD0",
 			       "PIN_AVB_TD1", "PIN_AVB_TD2", "PIN_AVB_TD3";
 			drive-strength = <12>;
@@ -507,7 +507,7 @@ scif2_pins: scif2 {
 		function = "scif2";
 	};
 
-	scif_clk_pins: scif_clk {
+	scif_clk_pins: scif-clk {
 		groups = "scif_clk_a";
 		function = "scif_clk";
 	};
@@ -518,7 +518,7 @@ sdhi0_pins: sd0 {
 		power-source = <3300>;
 	};
 
-	sdhi0_pins_uhs: sd0_uhs {
+	sdhi0_pins_uhs: sd0-uhs {
 		groups = "sdhi0_data4", "sdhi0_ctrl";
 		function = "sdhi0";
 		power-source = <1800>;
@@ -535,7 +535,7 @@ sound_pins: sound {
 		function = "ssi";
 	};
 
-	sound_clk_pins: sound_clk {
+	sound_clk_pins: sound-clk {
 		groups = "audio_clk_a_a", "audio_clk_b_a", "audio_clk_c_a",
 			 "audio_clkout_a", "audio_clkout3_a";
 		function = "audio_clk";
diff --git a/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts b/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts
index 637fc92dcc26..0926ab891fa5 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts
+++ b/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts
@@ -461,20 +461,20 @@ sd1-pwr-en-hog {
 	};
 
 	sdhi1_pins: sd1 {
-		sd1_dat_cmd {
+		sd1-dat-cmd {
 			pins = "SD1DAT0", "SD1DAT1", "SD1DAT2", "SD1DAT3", "SD1CMD";
 			input-enable;
 			renesas,output-impedance = <3>;
 			slew-rate = <0>;
 		};
 
-		sd1_clk {
+		sd1-clk {
 			pins = "SD1CLK";
 			renesas,output-impedance = <3>;
 			slew-rate = <0>;
 		};
 
-		sd1_cd {
+		sd1-cd {
 			pinmux = <RZV2H_PORT_PINMUX(9, 4, 14)>; /* SD1_CD */
 		};
 	};
diff --git a/arch/arm64/boot/dts/renesas/rzg2l-smarc-pinfunction.dtsi b/arch/arm64/boot/dts/renesas/rzg2l-smarc-pinfunction.dtsi
index 2616dbde4dd5..ee141993d93a 100644
--- a/arch/arm64/boot/dts/renesas/rzg2l-smarc-pinfunction.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg2l-smarc-pinfunction.dtsi
@@ -98,38 +98,38 @@ sd1-pwr-en-hog {
 	};
 
 	sdhi1_pins: sd1 {
-		sd1_data {
+		sd1-data {
 			pins = "SD1_DATA0", "SD1_DATA1", "SD1_DATA2", "SD1_DATA3";
 			power-source = <3300>;
 		};
 
-		sd1_ctrl {
+		sd1-ctrl {
 			pins = "SD1_CLK", "SD1_CMD";
 			power-source = <3300>;
 		};
 
-		sd1_mux {
+		sd1-mux {
 			pinmux = <RZG2L_PORT_PINMUX(19, 0, 1)>; /* SD1_CD */
 		};
 	};
 
-	sdhi1_pins_uhs: sd1_uhs {
-		sd1_data_uhs {
+	sdhi1_pins_uhs: sd1-uhs {
+		sd1-data-uhs {
 			pins = "SD1_DATA0", "SD1_DATA1", "SD1_DATA2", "SD1_DATA3";
 			power-source = <1800>;
 		};
 
-		sd1_ctrl_uhs {
+		sd1-ctrl-uhs {
 			pins = "SD1_CLK", "SD1_CMD";
 			power-source = <1800>;
 		};
 
-		sd1_mux_uhs {
+		sd1-mux-uhs {
 			pinmux = <RZG2L_PORT_PINMUX(19, 0, 1)>; /* SD1_CD */
 		};
 	};
 
-	sound_clk_pins: sound_clk {
+	sound_clk_pins: sound-clk {
 		pins = "AUDIO_CLK1", "AUDIO_CLK2";
 		input-enable;
 	};
diff --git a/arch/arm64/boot/dts/renesas/rzg2l-smarc-som.dtsi b/arch/arm64/boot/dts/renesas/rzg2l-smarc-som.dtsi
index 7eccdaffb221..b5f20ff17109 100644
--- a/arch/arm64/boot/dts/renesas/rzg2l-smarc-som.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg2l-smarc-som.dtsi
@@ -269,51 +269,51 @@ sd0-dev-sel-hog {
 	};
 
 	sdhi0_emmc_pins: sd0emmc {
-		sd0_emmc_data {
+		sd0-emmc-data {
 			pins = "SD0_DATA0", "SD0_DATA1", "SD0_DATA2", "SD0_DATA3",
 			       "SD0_DATA4", "SD0_DATA5", "SD0_DATA6", "SD0_DATA7";
 			power-source = <1800>;
 		};
 
-		sd0_emmc_ctrl {
+		sd0-emmc-ctrl {
 			pins = "SD0_CLK", "SD0_CMD";
 			power-source = <1800>;
 		};
 
-		sd0_emmc_rst {
+		sd0-emmc-rst {
 			pins = "SD0_RST#";
 			power-source = <1800>;
 		};
 	};
 
 	sdhi0_pins: sd0 {
-		sd0_data {
+		sd0-data {
 			pins = "SD0_DATA0", "SD0_DATA1", "SD0_DATA2", "SD0_DATA3";
 			power-source = <3300>;
 		};
 
-		sd0_ctrl {
+		sd0-ctrl {
 			pins = "SD0_CLK", "SD0_CMD";
 			power-source = <3300>;
 		};
 
-		sd0_mux {
+		sd0-mux {
 			pinmux = <RZG2L_PORT_PINMUX(47, 0, 2)>; /* SD0_CD */
 		};
 	};
 
-	sdhi0_pins_uhs: sd0_uhs {
-		sd0_data_uhs {
+	sdhi0_pins_uhs: sd0-uhs {
+		sd0-data-uhs {
 			pins = "SD0_DATA0", "SD0_DATA1", "SD0_DATA2", "SD0_DATA3";
 			power-source = <1800>;
 		};
 
-		sd0_ctrl_uhs {
+		sd0-ctrl-uhs {
 			pins = "SD0_CLK", "SD0_CMD";
 			power-source = <1800>;
 		};
 
-		sd0_mux_uhs {
+		sd0-mux-uhs {
 			pinmux = <RZG2L_PORT_PINMUX(47, 0, 2)>; /* SD0_CD */
 		};
 	};
diff --git a/arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi b/arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi
index b76b55e7f09d..1411e61a5300 100644
--- a/arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi
@@ -31,7 +31,7 @@ hdmi_con_out: endpoint {
 		};
 	};
 
-	sound_card {
+	sound-card {
 		compatible = "audio-graph-card";
 		label = "HDMI-Audio";
 		dais = <&i2s2_port>;
diff --git a/arch/arm64/boot/dts/renesas/rzg2lc-smarc-pinfunction.dtsi b/arch/arm64/boot/dts/renesas/rzg2lc-smarc-pinfunction.dtsi
index 92c64d58349f..92ec7935025c 100644
--- a/arch/arm64/boot/dts/renesas/rzg2lc-smarc-pinfunction.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg2lc-smarc-pinfunction.dtsi
@@ -79,38 +79,38 @@ sd1-pwr-en-hog {
 	};
 
 	sdhi1_pins: sd1 {
-		sd1_data {
+		sd1-data {
 			pins = "SD1_DATA0", "SD1_DATA1", "SD1_DATA2", "SD1_DATA3";
 			power-source = <3300>;
 		};
 
-		sd1_ctrl {
+		sd1-ctrl {
 			pins = "SD1_CLK", "SD1_CMD";
 			power-source = <3300>;
 		};
 
-		sd1_mux {
+		sd1-mux {
 			pinmux = <RZG2L_PORT_PINMUX(19, 0, 1)>; /* SD1_CD */
 		};
 	};
 
-	sdhi1_pins_uhs: sd1_uhs {
-		sd1_data_uhs {
+	sdhi1_pins_uhs: sd1-uhs {
+		sd1-data-uhs {
 			pins = "SD1_DATA0", "SD1_DATA1", "SD1_DATA2", "SD1_DATA3";
 			power-source = <1800>;
 		};
 
-		sd1_ctrl_uhs {
+		sd1-ctrl-uhs {
 			pins = "SD1_CLK", "SD1_CMD";
 			power-source = <1800>;
 		};
 
-		sd1_mux_uhs {
+		sd1-mux-uhs {
 			pinmux = <RZG2L_PORT_PINMUX(19, 0, 1)>; /* SD1_CD */
 		};
 	};
 
-	sound_clk_pins: sound_clk {
+	sound_clk_pins: sound-clk {
 		pins = "AUDIO_CLK1", "AUDIO_CLK2";
 		input-enable;
 	};
diff --git a/arch/arm64/boot/dts/renesas/rzg2lc-smarc-som.dtsi b/arch/arm64/boot/dts/renesas/rzg2lc-smarc-som.dtsi
index 15f2e9eaaf0b..a043f2f57036 100644
--- a/arch/arm64/boot/dts/renesas/rzg2lc-smarc-som.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg2lc-smarc-som.dtsi
@@ -189,51 +189,51 @@ gpio-sd0-dev-sel-hog {
 	};
 
 	sdhi0_emmc_pins: sd0emmc {
-		sd0_emmc_data {
+		sd0-emmc-data {
 			pins = "SD0_DATA0", "SD0_DATA1", "SD0_DATA2", "SD0_DATA3",
 			       "SD0_DATA4", "SD0_DATA5", "SD0_DATA6", "SD0_DATA7";
 			power-source = <1800>;
 		};
 
-		sd0_emmc_ctrl {
+		sd0-emmc-ctrl {
 			pins = "SD0_CLK", "SD0_CMD";
 			power-source = <1800>;
 		};
 
-		sd0_emmc_rst {
+		sd0-emmc-rst {
 			pins = "SD0_RST#";
 			power-source = <1800>;
 		};
 	};
 
 	sdhi0_pins: sd0 {
-		sd0_data {
+		sd0-data {
 			pins = "SD0_DATA0", "SD0_DATA1", "SD0_DATA2", "SD0_DATA3";
 			power-source = <3300>;
 		};
 
-		sd0_ctrl {
+		sd0-ctrl {
 			pins = "SD0_CLK", "SD0_CMD";
 			power-source = <3300>;
 		};
 
-		sd0_mux {
+		sd0-mux {
 			pinmux = <RZG2L_PORT_PINMUX(18, 0, 1)>; /* SD0_CD */
 		};
 	};
 
-	sdhi0_pins_uhs: sd0_uhs {
-		sd0_data_uhs {
+	sdhi0_pins_uhs: sd0-uhs {
+		sd0-data-uhs {
 			pins = "SD0_DATA0", "SD0_DATA1", "SD0_DATA2", "SD0_DATA3";
 			power-source = <1800>;
 		};
 
-		sd0_ctrl_uhs {
+		sd0-ctrl-uhs {
 			pins = "SD0_CLK", "SD0_CMD";
 			power-source = <1800>;
 		};
 
-		sd0_mux_uhs {
+		sd0-mux-uhs {
 			pinmux = <RZG2L_PORT_PINMUX(18, 0, 1)>; /* SD0_CD */
 		};
 	};
diff --git a/arch/arm64/boot/dts/renesas/rzg2lc-smarc.dtsi b/arch/arm64/boot/dts/renesas/rzg2lc-smarc.dtsi
index f3d7eff0d2f2..0d4c6b37d7a7 100644
--- a/arch/arm64/boot/dts/renesas/rzg2lc-smarc.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg2lc-smarc.dtsi
@@ -37,7 +37,7 @@ hdmi_con_out: endpoint {
 #if (SW_I2S0_I2S1)
 	/delete-node/ sound;
 
-	sound_card {
+	sound-card {
 		compatible = "audio-graph-card";
 		label = "HDMI-Audio";
 		dais = <&i2s2_port>;
diff --git a/arch/arm64/boot/dts/renesas/rzg2ul-smarc-pinfunction.dtsi b/arch/arm64/boot/dts/renesas/rzg2ul-smarc-pinfunction.dtsi
index 355694fe4af6..0be666c9049f 100644
--- a/arch/arm64/boot/dts/renesas/rzg2ul-smarc-pinfunction.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg2ul-smarc-pinfunction.dtsi
@@ -69,38 +69,38 @@ sd1-pwr-en-hog {
 	};
 
 	sdhi1_pins: sd1 {
-		sd1_data {
+		sd1-data {
 			pins = "SD1_DATA0", "SD1_DATA1", "SD1_DATA2", "SD1_DATA3";
 			power-source = <3300>;
 		};
 
-		sd1_ctrl {
+		sd1-ctrl {
 			pins = "SD1_CLK", "SD1_CMD";
 			power-source = <3300>;
 		};
 
-		sd1_mux {
+		sd1-mux {
 			pinmux = <RZG2L_PORT_PINMUX(0, 2, 1)>; /* SD1_CD */
 		};
 	};
 
-	sdhi1_pins_uhs: sd1_uhs {
-		sd1_data_uhs {
+	sdhi1_pins_uhs: sd1-uhs {
+		sd1-data-uhs {
 			pins = "SD1_DATA0", "SD1_DATA1", "SD1_DATA2", "SD1_DATA3";
 			power-source = <1800>;
 		};
 
-		sd1_ctrl_uhs {
+		sd1-ctrl-uhs {
 			pins = "SD1_CLK", "SD1_CMD";
 			power-source = <1800>;
 		};
 
-		sd1_mux_uhs {
+		sd1-mux-uhs {
 			pinmux = <RZG2L_PORT_PINMUX(0, 2, 1)>; /* SD1_CD */
 		};
 	};
 
-	sound_clk_pins: sound_clk {
+	sound_clk_pins: sound-clk {
 		pins = "AUDIO_CLK1", "AUDIO_CLK2";
 		input-enable;
 	};
diff --git a/arch/arm64/boot/dts/renesas/rzg2ul-smarc-som.dtsi b/arch/arm64/boot/dts/renesas/rzg2ul-smarc-som.dtsi
index 0f917d7c9939..99d30fa9a1a8 100644
--- a/arch/arm64/boot/dts/renesas/rzg2ul-smarc-som.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg2ul-smarc-som.dtsi
@@ -204,51 +204,51 @@ qspi0_pins: qspi0 {
 	};
 
 	sdhi0_emmc_pins: sd0emmc {
-		sd0_emmc_data {
+		sd0-emmc-data {
 			pins = "SD0_DATA0", "SD0_DATA1", "SD0_DATA2", "SD0_DATA3",
 			       "SD0_DATA4", "SD0_DATA5", "SD0_DATA6", "SD0_DATA7";
 			power-source = <1800>;
 		};
 
-		sd0_emmc_ctrl {
+		sd0-emmc-ctrl {
 			pins = "SD0_CLK", "SD0_CMD";
 			power-source = <1800>;
 		};
 
-		sd0_emmc_rst {
+		sd0-emmc-rst {
 			pins = "SD0_RST#";
 			power-source = <1800>;
 		};
 	};
 
 	sdhi0_pins: sd0 {
-		sd0_data {
+		sd0-data {
 			pins = "SD0_DATA0", "SD0_DATA1", "SD0_DATA2", "SD0_DATA3";
 			power-source = <3300>;
 		};
 
-		sd0_ctrl {
+		sd0-ctrl {
 			pins = "SD0_CLK", "SD0_CMD";
 			power-source = <3300>;
 		};
 
-		sd0_mux {
+		sd0-mux {
 			pinmux = <RZG2L_PORT_PINMUX(0, 0, 1)>; /* SD0_CD */
 		};
 	};
 
-	sdhi0_pins_uhs: sd0_uhs {
-		sd0_data_uhs {
+	sdhi0_pins_uhs: sd0-uhs {
+		sd0-data-uhs {
 			pins = "SD0_DATA0", "SD0_DATA1", "SD0_DATA2", "SD0_DATA3";
 			power-source = <1800>;
 		};
 
-		sd0_ctrl_uhs {
+		sd0-ctrl-uhs {
 			pins = "SD0_CLK", "SD0_CMD";
 			power-source = <1800>;
 		};
 
-		sd0_mux_uhs {
+		sd0-mux-uhs {
 			pinmux = <RZG2L_PORT_PINMUX(0, 0, 1)>; /* SD0_CD */
 		};
 	};
diff --git a/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi b/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
index b45acfe6288a..9333edb34e34 100644
--- a/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
@@ -234,7 +234,7 @@ txc {
 			drive-strength-microamp = <5200>;
 		};
 
-		tx_ctl {
+		tx-ctl {
 			pinmux = <RZG2L_PORT_PINMUX(1, 1, 1)>;  /* ET0_TX_CTL */
 			power-source = <1800>;
 			output-enable;
@@ -277,7 +277,7 @@ txc {
 			drive-strength-microamp = <5200>;
 		};
 
-		tx_ctl {
+		tx-ctl {
 			pinmux = <RZG2L_PORT_PINMUX(7, 1, 1)>;	/* ET1_TX_CTL */
 			power-source = <1800>;
 			output-enable;
diff --git a/arch/arm64/boot/dts/renesas/salvator-common.dtsi b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
index 1317ede2f719..ee4e54f860c3 100644
--- a/arch/arm64/boot/dts/renesas/salvator-common.dtsi
+++ b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
@@ -686,12 +686,12 @@ mux {
 			function = "avb";
 		};
 
-		pins_mdio {
+		pins-mdio {
 			groups = "avb_mdio";
 			drive-strength = <24>;
 		};
 
-		pins_mii_tx {
+		pins-mii-tx {
 			pins = "PIN_AVB_TX_CTL", "PIN_AVB_TXC", "PIN_AVB_TD0",
 			       "PIN_AVB_TD1", "PIN_AVB_TD2", "PIN_AVB_TD3";
 			drive-strength = <12>;
@@ -738,7 +738,7 @@ scif2_pins: scif2 {
 		function = "scif2";
 	};
 
-	scif_clk_pins: scif_clk {
+	scif_clk_pins: scif-clk {
 		groups = "scif_clk_a";
 		function = "scif_clk";
 	};
@@ -749,7 +749,7 @@ sdhi0_pins: sd0 {
 		power-source = <3300>;
 	};
 
-	sdhi0_pins_uhs: sd0_uhs {
+	sdhi0_pins_uhs: sd0-uhs {
 		groups = "sdhi0_data4", "sdhi0_ctrl";
 		function = "sdhi0";
 		power-source = <1800>;
@@ -767,7 +767,7 @@ sdhi3_pins: sd3 {
 		power-source = <3300>;
 	};
 
-	sdhi3_pins_uhs: sd3_uhs {
+	sdhi3_pins_uhs: sd3-uhs {
 		groups = "sdhi3_data4", "sdhi3_ctrl";
 		function = "sdhi3";
 		power-source = <1800>;
@@ -778,7 +778,7 @@ sound_pins: sound {
 		function = "ssi";
 	};
 
-	sound_clk_pins: sound_clk {
+	sound_clk_pins: sound-clk {
 		groups = "audio_clk_a_a", "audio_clk_b_a", "audio_clk_c_a",
 			 "audio_clkout_a", "audio_clkout3_a";
 		function = "audio_clk";
diff --git a/arch/arm64/boot/dts/renesas/salvator-xs.dtsi b/arch/arm64/boot/dts/renesas/salvator-xs.dtsi
index 1d18dedb1ff0..f5157940bd60 100644
--- a/arch/arm64/boot/dts/renesas/salvator-xs.dtsi
+++ b/arch/arm64/boot/dts/renesas/salvator-xs.dtsi
@@ -72,7 +72,7 @@ &pfc {
 	 *	- Connect GP6_3[01] to BD082065 (USB2.0 ch3's host power).
 	 *	- Connect GP6_{04,21} to ADV7842.
 	 */
-	usb2_ch3_pins: usb2_ch3 {
+	usb2_ch3_pins: usb2-ch3 {
 		groups = "usb2_ch3";
 		function = "usb2_ch3";
 	};
diff --git a/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi b/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi
index 97014bcfbb1d..603c791e438d 100644
--- a/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi
+++ b/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi
@@ -84,7 +84,7 @@ reg_5v: regulator-5v {
 		regulator-always-on;
 	};
 
-	wlan_en: regulator-wlan_en {
+	wlan_en: regulator-wlan-en {
 		compatible = "regulator-fixed";
 		regulator-name = "wlan-en-regulator";
 
diff --git a/arch/arm64/boot/dts/renesas/ulcb.dtsi b/arch/arm64/boot/dts/renesas/ulcb.dtsi
index 119f2b5024b3..cedff8e0157e 100644
--- a/arch/arm64/boot/dts/renesas/ulcb.dtsi
+++ b/arch/arm64/boot/dts/renesas/ulcb.dtsi
@@ -311,12 +311,12 @@ mux {
 			function = "avb";
 		};
 
-		pins_mdio {
+		pins-mdio {
 			groups = "avb_mdio";
 			drive-strength = <24>;
 		};
 
-		pins_mii_tx {
+		pins-mii-tx {
 			pins = "PIN_AVB_TX_CTL", "PIN_AVB_TXC", "PIN_AVB_TD0",
 			       "PIN_AVB_TD1", "PIN_AVB_TD2", "PIN_AVB_TD3";
 			drive-strength = <12>;
@@ -338,7 +338,7 @@ scif2_pins: scif2 {
 		function = "scif2";
 	};
 
-	scif_clk_pins: scif_clk {
+	scif_clk_pins: scif-clk {
 		groups = "scif_clk_a";
 		function = "scif_clk";
 	};
@@ -349,7 +349,7 @@ sdhi0_pins: sd0 {
 		power-source = <3300>;
 	};
 
-	sdhi0_pins_uhs: sd0_uhs {
+	sdhi0_pins_uhs: sd0-uhs {
 		groups = "sdhi0_data4", "sdhi0_ctrl";
 		function = "sdhi0";
 		power-source = <1800>;
diff --git a/arch/arm64/boot/dts/renesas/white-hawk-cpu-common.dtsi b/arch/arm64/boot/dts/renesas/white-hawk-cpu-common.dtsi
index c5045bda45c3..2bcd486b03e9 100644
--- a/arch/arm64/boot/dts/renesas/white-hawk-cpu-common.dtsi
+++ b/arch/arm64/boot/dts/renesas/white-hawk-cpu-common.dtsi
@@ -320,12 +320,12 @@ mux {
 			function = "avb0";
 		};
 
-		pins_mdio {
+		pins-mdio {
 			groups = "avb0_mdio";
 			drive-strength = <21>;
 		};
 
-		pins_mii {
+		pins-mii {
 			groups = "avb0_rgmii";
 			drive-strength = <21>;
 		};
@@ -368,7 +368,7 @@ qspi0_pins: qspi0 {
 		function = "qspi0";
 	};
 
-	scif_clk_pins: scif_clk {
+	scif_clk_pins: scif-clk {
 		groups = "scif_clk";
 		function = "scif_clk";
 	};
-- 
2.53.0

