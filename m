Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8D6837C0FF
	for <linux-renesas-soc@vger.kernel.org>; Wed,  2 Sep 2026 10:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788346125; cv=none; b=Rngq2IeERNRfEIX0MCwUe0sYh4Gcx7JYFhZG56uMHLPMFJjDeuVNTa1NeQqO7Z3VtxwpgAKR7+XKCHeF0FdyRLUBTGUQgYNv9hCzQZGo0TJoPG0k3lH3Sd7uZD/3kTAmlYwDtq38uy5NcxmkyBcQaOY+JN8CesbJKzqqlsf+Lww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788346125; c=relaxed/simple;
	bh=y0jCAG6BlkDtftWNp8Pykh0uKWwmdqdFoov+BYFffCY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Hi1lO08xujBl/e3X6vnegwTxg6PAQ0ZJU+Fvht8YAD2J5DvxVF/VNz6o1koGV5ROqx6jVEwQe+CM1zN0ObiOFLv6Hx3yuCPCiGQ6GzxMyl3rivwMVBgjbZnv8sxtfElEQAE4Z1jRrNHL6tePip+xlohpDmCUb+YjyNSo5+1CBGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mgIyHqRh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JyjQIAYh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mgIyHqRh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JyjQIAYh"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6829NCIg2246327
	for <linux-renesas-soc@vger.kernel.org>; Wed, 2 Sep 2026 10:48:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DVZQyoqDvaTn7mOywuRGqmToqms6HdyP/g5jqzvv/sg=; b=mgIyHqRhNmaHhNaX
	vjjaTqhnEiFr9C9YUY2hiahD+hJlYNQ+eWcPifk53PL6eLFpPNzppGpIpV5phaeP
	hPaRX1D27TpzlhhkrsoeUTlmeS0trCuDazTYIWzjLlRGRmz/wCcravA3lOseLasP
	ejjhpRJVCCFLiPosUVr6Q5o/6mUK+6my9Nh5yf4zaStyZ3Lyrkretat51KYmqQVw
	N9epMWO6Ue6FzDecqLbSVz8rIpckWKn3A9AUQ9Smxqp+W26bBusMdg2UDy8Cmacp
	WmMLx8P5TMLbMiRKkIReL9uDPEiH7vSnMA7g30JP3j5vgPu85aZQIj5+BwBFYg89
	l6vQ/w==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ge8whj4nf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Wed, 02 Sep 2026 10:48:39 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-930b571432fso156899485a.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 02 Sep 2026 03:48:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788346118; x=1788950918; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DVZQyoqDvaTn7mOywuRGqmToqms6HdyP/g5jqzvv/sg=;
        b=JyjQIAYhRcqY5No+Uwt2NH+S0YN5wSNzUKbmoz85cjc/wNAmik0VOxY9xR6ES8SbSp
         XYlntLLabnReCoPs92fUJxSEmA7mVsSGHHAyEgeDSxIcf/cyGWI0dKhiZUlGjkruVj2v
         hgDZP0KwS/TlZgI8bHY7Abhm5iHXGaAuhSWnJFg/ysns5DIOBhBZRPLbx+fzUivf6kt8
         JZljReMhIRDK8kbYcYf3NjABwl5/SpyRMCNm9WZKTMTwrm2LvbMdPV6Jo7cUj0oC36Cs
         WmfjjZE/MgcuHiBZU9TtWMx/LpI75m2IBwv5rbkKCwrMbDV4jolBSf0saR296GNA2ONY
         F9LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788346118; x=1788950918;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DVZQyoqDvaTn7mOywuRGqmToqms6HdyP/g5jqzvv/sg=;
        b=lNYrL4Sou6my1g15J/Dg2dmNBna1saIcxBPyO6GRgNzUqb0eIYL+kJCpAZTk3ORlrm
         C/K0fob1NOMXP7fFlDWaj0+YNiELffWDR0vE8i9eLWqfvE2uzUh+4N7E73dninz36eco
         0Q5i3n5LgGI40IXekJbWQHe0ElFPqKeCopwNq0msUEYLkIavh3FK7mBTzHUi5dN8/m0I
         dhAKjQdihzJol0Php41Mv1yA5dnWYck+P6Qan4LH4E382llfqV4jIEUaRiIgRyPMS18Q
         t3J9uFfWRQi1fWzpVJnheQTrD1oCiQBP5lsbRIq4pzZE1ZgEYXFpOm43WD3JbA/oYvl+
         O3+w==
X-Forwarded-Encrypted: i=1; AHgh+Rrj7xb/eFlTIXrQCtTnxOEnKPqNB/Cult4Zh4eyt/TG8ocSuOqd1ME4sdUaugkuwi1E7fj3lekwjJEA3C024bnQZQ==@vger.kernel.org
X-Gm-Message-State: AFuF++kiXxr4bfWto7tUA82KL6BC7bW/YlClIsiWXnE8o8BPUoj/BGmK
	ZbDu76gCOecZtdKNQzhmJEzB5w9bnsVzBReYcSls4Mt88tGX6HPm7kMSEhfGfO9to9cW5SYKiiH
	0QjVSg2VAmRz08SMmUQKVyWOPQ7Z8/1B9zCzKv1etCjW7RQHBP9Jf2Fav9Gsgfc77/N7KGqOwfA
	==
X-Gm-Gg: AR+sD12vGRZ04/mHIvqnsWaApnPVKILm4fkywcIGjCRhNg5N8iw5ZMYxQjR1w2E8+UL
	0IeuJfctoOazFlaHh+NRE5ErT1tJiPR72q95R61D/J/ZkoGJgHKAQd/rHyyGZfzsJzVdPR2LM2P
	Z2WBPIyvjSsul5xcZxnGW2szSQXl8itFL8Tt/r9h5D9lJrtBg1lDmfepTnTQ+6J3ep+3IHeThyu
	Y0l6B43mB10oOqQdr8FBfieacTmGZ0ySkJBQg7srERszT1zxwhBcZWsCKWWJy6gvxMUuKrpuF3S
	n2vVRKIZDV8Nt3NXrjeXVbyFsI4+pEKH1SYL8wBP999nVNb9c6OuRzuKs6iO49x+XrDFvEeCuPs
	O02GVS4yyxUPD97IwPKG/5JSl52Q=
X-Received: by 2002:a05:620a:6082:b0:934:a0b2:9bde with SMTP id af79cd13be357-93965cad113mr198108685a.23.1788346118175;
        Wed, 02 Sep 2026 03:48:38 -0700 (PDT)
X-Received: by 2002:a05:620a:6082:b0:934:a0b2:9bde with SMTP id af79cd13be357-93965cad113mr198105085a.23.1788346117728;
        Wed, 02 Sep 2026 03:48:37 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:b759:bed7:f8b6:ccad])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce4780f0dsm56543255e9.12.2026.09.02.03.48.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 03:48:36 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>, Biju <biju.das.au@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: (subset) [PATCH v5 0/4] Add RZ/G3L PWRRDY power sequencing support
Date: Wed,  2 Sep 2026 12:48:34 +0200
Message-ID: <178834610100.25291.2104164353458457127.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260826122742.153643-1-biju.das.jz@bp.renesas.com>
References: <20260826122742.153643-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=fLkJG5ae c=1 sm=1 tr=0 ts=6a97ff07 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=2Ww_MoSDT8ibEw9cI9gA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: g4NpHGC9trKNNoHzKb35tz6LGYTMPhlY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDA5NSBTYWx0ZWRfXwvsgabPPj1CW
 qORlEcGstWdfkD+gXxymasLE8gBwU793uVHvgjoiFyw3Me7RI9Zw3DfSIIvQboT6HKzT0WKrqUS
 qXPb6PdhBeIbR7HNRlaW7XVaQQpl6fbTYNor2lKDJOVbi0gCiFUvsuJh+I60V7ex2x+UoTLwugE
 HinXrukWRcQaBlNb4saB1WuiZhjUyX0L77bkbkWmODZ8VfxR1WgbxAwqc3s7Pu/1RWxxFlxmm+J
 Y5Ja+mc9rTBpxaR0gxIQM5QL9GyIuAogRyJZLFjK4KL3mOdO5C7bp2fy7FxU3GdtaY9NigahUX9
 5QZVF4q0tRjVEzxMNqxpRjAFH4GwVqUIBNyiT8gLpmNMICNPX36ozfuymEaykbdQURXAYueEYr/
 m3iduZBYFXJ5XASNYWnzSeptTtYUzCucB4OSr07s03HJ33XVQv1hxFEvNdOg2l5Y8OrKDvE/ugA
 MfxWXU48pYuBGP3Ja2A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDA5NSBTYWx0ZWRfX+2rh1T/oOofQ
 Da4AYJIw5s98GNhNi6G6hEcZi1i/ApbErTQ41rTPROxcFSDaCOVAErD6tvfJfyJg5aISMXqpks2
 wohIKrA03yzSz52VO3LmVeM4t6hBKbM=
X-Proofpoint-GUID: g4NpHGC9trKNNoHzKb35tz6LGYTMPhlY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_02,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 spamscore=0 phishscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020095


On Wed, 26 Aug 2026 13:27:22 +0100, Biju wrote:
> Some RZ SoCs (e.g. RZ/G3L) have a PWRRDY register that signals power
> readiness for various IPs (USB, DSI, CSI, etc.) to their respective
> controllers. This register is part of the SYSC IP. Add a dedicated
> power sequencing driver to handle these signals.
> 
> This series is based on proposal for power sequence driver [1]
> for USB PWRRDY signal and DSI PWRRDY signal[2].
> 
> [...]

Applied, thanks!

[3/4] power: sequencing: Add Renesas RZ/G3L Power Ready driver
      https://git.kernel.org/brgl/c/3b04e9b8056e868c3e9a04cc74168c7c9a18746a

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
