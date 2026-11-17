Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794910642;
	b=zqlPtNzXV378/obqYOxcM4FQyZ5MsaXXE8Odc+OgMN8TbO/Lx3IPVh/bA0iEteX+aYAA
	 Ds2+jPchV/GonPJoucBv/vJYQGUS/IuD6EZRDhq+7yJIfep/Kl/K0Guq41Jxncy46S8+S
	 YHC1TKDbr/mWzD47Ijglrzmuqo348xuvB2vbLEPNrTMyBTmLtrnBI68soLLlbEgqzZxqA
	 juT72CgmoQZSiJqR1szPkXGJpkGVjuRQFy1jgsNx7u4aQpL2ib57J75bCWyZailVRHsaM
	 GWiOu1Ctjh6+iD6lZ590aXL1BfGf3MW51dcoFE0gL0zA0+TTwO3aHkXRM82nd4Ailrw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794910642;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=wy0o00qQ9NmDrgxeDIl4krt4Qft031prUV52bY95lck=;
	b=XcoWhPp3wol6RBjIFVmvcUhuWOl/4kmowwLX+FnJJe/9/mdlXXqwHiTZucg+h4QbhQTE
	 CYaoaPvIn2hH6bRJ/HuOD/k21F+/ChCydvVmuN64bvEfaiZ9wko2QJQctSfkYWjJYgcN5
	 cSdtjoriBdWYTcCwQzges/7TIztRs0x9nHS6K6GZvv81DOlrJQmY0yT2x9XV9et7SZ0HY
	 T07Ie1qSW3B6DNCg0nA4rgbBUzUB6fonjQnv7vBKm280e/BhkV2awoEabTHa3fDFAD/95
	 /jnAXVfThhph4HU++hRSKh0MTgpa5SU+nynqFCnV3R4298nIPS20fOMUCMNb8r6t7rQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gmSd6pp2;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eRlgvPkj;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D30FF606A329
	for <linux-renesas-soc@vger.kernel.org>; Tue, 17 Nov 2026 10:17:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D30FF606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gmSd6pp2;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eRlgvPkj
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH8vO5P844321
	for <linux-renesas-soc@vger.kernel.org>; Tue, 17 Nov 2026 10:17:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wy0o00qQ9NmDrgxeDIl4krt4Qft031prUV52bY95lck=; b=gmSd6pp2gxmgeKJn
	lo7uVTqxtdYWP4b0PrnTpukDzwAaIStTUl5WZn8arC2IZ2/tCCWM34OWOyl2GnLh
	MaFw38aK4rpe/r3w7BCQmZQ221KeHz6KSJy0+XgD2A3eg6GTSeHrmOCUNKpGYeEX
	DQU+UaxfABfe+/t5qiVJH2UPFFOvyKOOREw9rrisAUDTOG1OM7GISdvnjcndlGKo
	zVYT4vv6Sb+iCgX+qFE3M9dKntJcGSbypHpCZ95wdeOj7t468LbIO2Yfcoqjg5S8
	Y3VvHh8BAY0xEnTMHzcugjF+GT0dmNBy2IPuSiQurcGXz5q0ChbsT0tywKA4JuLw
	R0/LEg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0c7h215n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Tue, 17 Nov 2026 10:17:20 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f5844cb60so151121685a.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 17 Nov 2026 02:17:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794910640; x=1795515440; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wy0o00qQ9NmDrgxeDIl4krt4Qft031prUV52bY95lck=;
        b=eRlgvPkjKtfuWOs7l9YMAeH8UFJnzxOUh8mhEhvkHFW3gcFGnzt8pOGJ11+dKQuC1W
         4dlbl/xXBoarfI3cLAg0H0B/VZphyvg6KLCvu+vL7fUMSP7EeMQbWly+VmoKQId4BmW1
         OHpHYieaI9kLwjTmxoMboeXHDrw5pWn3mJWtXPaKyIMXxlO5k/XiEN2X9J4xcHbnFKVB
         OdeHqrgWTZjnc+A+Sg+C8MkWmT3h8KzVxvgrv1laGMVYSiyHjqXgsUboiVnUHn630buW
         16PyC/Jio3ZnNNKIgzfgFL3SUsIs/ut9UQuemxavTg+55Um3wKJcZOeP1wkqIs3ChF+S
         W/SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794910640; x=1795515440;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wy0o00qQ9NmDrgxeDIl4krt4Qft031prUV52bY95lck=;
        b=cgJh1gwlI2WjoyNc/2ki7/VFPPmlAPglxqv9/y4hypAQj7PEJbw88YczF54DS5LVN1
         0An63Gt0HLzqcrOi264x+XLgeW26uA+SgbDzvho66cd5PnrGqdJtkFEGBNew++WG+7kF
         HmbOl/OvP3DLtzYk/YDqyv8shavIHxR4UMKfRhQR5XkMMJ2d2AAmKn+chyNOlRqb5x8x
         OXcYpdrZWOCuJB0vthkI79XExt6U/d47WfLS89hQKsIdZGlx8cjymhoE/t2Pi52MjanQ
         8r7JdA5RmU6Ma/R9DsqDJSNOEy7kRXF+3Tc/uzho6qoprZ46PWNuwyK49UZFUw3Hh9Qu
         8Jug==
X-Forwarded-Encrypted: i=1; AL+hErFrk+7wf3d9rGkby/DwyePKrdAMGqt7fYE5Vh0mLTuZhO6S0o3h9icSsuMv+2BRdQ1k8l/x6tm1MWxDmNNGjvNztQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z8TbH1WxUL21iscV60faIvpwmu/iZ2mADt+zxQbfRNjzQdGkTET
	PFgTe4PgDht968RAOtnd7F3W5gRx1D46qb60PLgsNibUxNhzvlx8yQpADYZnqQpyeWWApUGOA1a
	pDEJbwpFmBcQTkTQydfmLs3sLScCNQExlAjVBc3BobH5TdAqq0iL/iMUu4oIicZhhZFw0fgajxA
	==
X-Gm-Gg: AYBFou3aFLqfDG5277dNIFwOfecICzMckPqer5tOt5ZHGODam6n3CFc8zDsBC4Y+2z6
	7kaeP0ycCAvIQoqpE8kCebZDCCe9C++SxL36Jwm1xASAgr8Qzdb5Y6RX4Ihk2RdwM7CohnDUwsD
	7NoiQ9EeXDNAVxfwWHHHA9q6YuECdd0TrDb0qkoOi2hQ+pRv9pg6QVnApJ6i3Ku2pwIXeUUaXav
	f+xgJU7X7bDstYZhZbu1+kxl6W735TBqnBtdfhP8jtdgHKOBppu6xBZTokXR82ePqd/tArHPn46
	FcMrBpuNaaZPUc85hYp8/0/5Twl2PWFvBhXzr77nCqgXqdpqYEz5v8k4BHbrnHIZHTonlmEuGSt
	VfF9tRaSx5blAvwnuElvNelBKVaeKNFOnHPwHMlYaHcpqzC5j3ZTwq05X1hwF4StmwYyIFn2vn7
	I=
X-Received: by 2002:a05:620a:4890:b0:93f:2571:c317 with SMTP id af79cd13be357-9498b922379mr349875385a.28.1794910639916;
        Tue, 17 Nov 2026 02:17:19 -0800 (PST)
X-Received: by 2002:a05:620a:4890:b0:93f:2571:c317 with SMTP id af79cd13be357-9498b922379mr349872885a.28.1794910639508;
        Tue, 17 Nov 2026 02:17:19 -0800 (PST)
Received: from brgl-qcom.local ([195.50.164.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb78418853sm83827935e9.8.2026.11.17.02.17.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 02:17:18 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Prabhakar <prabhakar.csengg@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Prabhakar <prabhakar.csengg+renesas@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: (subset) [PATCH v2 0/5] Add ADC power sequencing support for RZ/V2H(P) and RZ/V2N SoCs
Date: Tue, 17 Nov 2026 11:17:16 +0100
Message-ID: <179491063406.27909.15006722116661437367.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261009165710.1320233-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20261009165710.1320233-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: l6gqxnE6J0UDTtx7aFGnrmqJFtz08S3W
X-Proofpoint-ORIG-GUID: l6gqxnE6J0UDTtx7aFGnrmqJFtz08S3W
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA0MCBTYWx0ZWRfX3NtfhZbGYTxk
 LRtcV6Df7JwGQPUHQC88qLmo0MzUS/O4Lg6SZVIyQ1J+ql6DiDGK5KCSMuuxUtpKWavjdNOhRnA
 xBg0LD7IuZWJeJGlwES7q4tUKx1oame85VTmYb2tCyh8Kb/A3At9ne+Ip88z7eFICFGme4PmsVO
 xW3TbO83AOxcUIh++UE+wXTS+XZCHrdd5gtwIszfxO8KTDRPrPOiI/irbzUP6of3Z4br0MgY0DH
 qWugkxhtBzXtdRkEDBNMyeH1dxVkVyTW/nbwnO2UA4NRv63dNDMJUui1rEbLA2f3OSUpL7q1clc
 n4yQoLr9IqnXNSASDIZ1nz6DbtKX8MP14JvsOxAewCGDf6ifVbs5usUoVoNhp+a5FRQdjfyEPah
 KaELnouj/4MElSJc1d6JVF9huhX3Hd/ZCKkUHNfCdjO/8ZPvm4H1nuhm3EyRaPiHM6n2CAK9/TS
 fMmRgBnpLz4DwCp8Inw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA0MCBTYWx0ZWRfX0t3L1nrsaqK0
 CqH7RSpG/N2G3BWanxKXSmeIK2ESnpqWo/FRy6w9Q4qTcpbnLZt6/lCLEm/FyWUMCG9km6KJ5ww
 qjEM7Rnrur8VkiImZI08fKH0L/QRZ78=
X-Authority-Analysis: v=2.4 cv=bobZl0ai c=1 sm=1 tr=0 ts=6afc29b0 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=Jk2/TV77q6/E6wQq2oQJxQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=yC-0_ovQAAAA:8 a=EUspDBNiAAAA:8 a=VkPfdC8VYmQ3GCa23YcA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 phishscore=0 clxscore=1015 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170040


On Fri, 09 Oct 2026 17:57:05 +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Hi all,
> 
> This patch series adds support for ADC power sequencing on the RZ/V2H(P)
> and RZ/V2N SoCs. It introduces per-SoC probe functions for the
> renesas-pwrrdy power sequencer driver and ensures that the necessary
> Kconfig options are selected for these SoCs.
> 
> [...]

Applied, thanks!

[3/5] power: sequencing: renesas-pwrrdy: Support SoC-specific probe configuration
      https://git.kernel.org/brgl/c/a0e667a33418a0598c0a2281aec407134d66539a
[4/5] power: sequencing: renesas-pwrrdy: Add RZ/V2H(P) and RZ/V2N A/D converter support
      https://git.kernel.org/brgl/c/2b8b9c3cebe0f54a7bc5962b748d2c71ed2125b2

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
