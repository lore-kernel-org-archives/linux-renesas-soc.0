Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793182981;
	b=bGI/Ym+fpQJZvQ9QAZqJMFEIm7PG3gBLRuOMTjCGp/ZO3EOtdC1W1vcnopBQ46rTsWtB
	 z/Ovq/3rK3V5UisB1E/NulHPNekhLohg5vgq5zGO8Fh7fzco3Hvu/hak8gLrR2n0eBBpX
	 oUiLo81udagpwYuC+LmJj/2++v/CfuLxTsyhrbbBOwUf0xLvbSU6LDACVoMZ+H0BupUIh
	 4kBU+o3SdhF7C5uuf7UnWX8sk63pEEoMoHfUrnyvMqhVPQugsAMz6UxGuknmBufZHRW+D
	 2E8JgmczailuA0ZpFH/wC+hljsbIda3P/ERtmhVQpLdCqk00WkmvhEqyd2A7mp2ZDIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793182981;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=fJLqm9V4jsOFfA6wxHEcJun15GePDPlJxumBUvgqgGU=;
	b=Lcg8iY5aej0DMhpOiQGg0p8Zp/hJxPu0UK3DQqAC9DzRHjbi3+ZraEO4ClXIG26pr/r1
	 e6/pGGNaIAlBU+bxOYrwZ//uRXBPnItN9jGatcM2Z/tvxln7kGDGjKpYP/q+MQD7ZTfcU
	 roNyNtAAgeoBtorBql0dfT8n0LWiyKGAABmYc+kZrsfrw8Ze0kGWaIt2RmesOBuXNJ/HI
	 7bcVcz2ly+x75P1UGJY0vNHPDM1gBm3XbASyCVPYYIXXs9UWZbSBOY/v0w/JNJ/bDa2zY
	 nkosIY+AXjvM7hH+aCpY1/QkdwIY9SrGxgxLOzwIFbUZjgJAFBFx6yHLaVnN5SWvIow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UqJ49b6j;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cEelwyrf;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 906FF606A31E
	for <linux-renesas-soc@vger.kernel.org>; Wed, 28 Oct 2026 10:23:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 906FF606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UqJ49b6j;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cEelwyrf
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69S8K8w2253381
	for <linux-renesas-soc@vger.kernel.org>; Wed, 28 Oct 2026 10:22:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fJLqm9V4jsOFfA6wxHEcJun15GePDPlJxumBUvgqgGU=; b=UqJ49b6jcBEGRk4N
	SMcg+4URhJJuhk3SeW8bv8F4v6ep04YNfItmRsT7kGdv+WqjQJKm8XECwY4SMr0l
	Cw/OBTIt6b7DBmuLNZWP8tSDKfneEmZ9lmTLN4s83EFFQ2wUGYRQgdk3Qmsx/Sqw
	HmjX8jCJG8Ku0powhzuVEZgUKBbyf+LRYDEpuzykx0+rHBLgnExjTCzLMLuaB5Nr
	NXwXvgaq8a8hJvmaBjuRP02xX3M8WljiBZQ84/2smhW8KyRJ9piZfexGD740N+Dd
	l3uF0WZOQ6TPpfwjtKiQUeG2pXrZB6HgovunNh649Zgzo8MWX738zXTzSIzmSdhS
	B5MMcA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hk6be1yny-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Wed, 28 Oct 2026 10:22:59 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f13c143c8so130573385a.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 28 Oct 2026 03:22:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793182979; x=1793787779; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fJLqm9V4jsOFfA6wxHEcJun15GePDPlJxumBUvgqgGU=;
        b=cEelwyrfGfmlt35tTqod9Uw9EXTfW+0PqqluJChECzfmxHszHmi524Yrh/sCXh9AxM
         sscjoDTAIjs8OQk7wTnXfZ7M5NlZeCrJpwDVRhAFMzml+X0uj2SZxOeeyS8lWbDlBZkd
         RjuhhLSANG4wmC+5ZN1LDpJPsaPpAmv8WKwEN6W4w9YRnv8fWmErGzyLGahakNw+u/6o
         VeqFM0/z0Xcrm2SHQhK4AuGpqs72lseYQJG8BQGDQ037Z11+GelEbTOBHx4Ehz8s0z6s
         6tRg2HpqWbzFXgAEFE4Fh8CyUp/GseaYCuDT8LtUzYpggWrPYOwhv/lxpukkZc3md7r4
         UJkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793182979; x=1793787779;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fJLqm9V4jsOFfA6wxHEcJun15GePDPlJxumBUvgqgGU=;
        b=vxyDP+YUZrs7iggL3U4RDjUck7vASi2hnb5jIz3bdo5anhm8uDSyLqTHESm5XTjVvx
         pITrQ4WbS6zGISUc7BE72AQFnuE+gEvhrnG7oExHQrV06W4ysRvvq419vNEUwxRmJ8zB
         m8PxEAA6JeXJlD9DVHZe6vwlLLBNEYryLJt8JunjobBXA1LvYeFt0+7yD4/54kMOKiAh
         yXpxTYqN4b7hQF7n5+WImvudcSZARfRyo7SV4DwEJ7eFs0vgrmyD5AyjoU0JCEkkOhxk
         HkUcLgRutzl2i+fQGcZ4OKma934fkf8S1mUgu5LIwAjOtjbAhIBuxzoimBmmLjZCZYe7
         AHIA==
X-Forwarded-Encrypted: i=1; AKwUvBzgUK+eY/vRZXVrurb8V+VlPpKjrRSRSnSLQDYuwkm/3p4ToAtYT5s+8sTwktt4bL1GTp2UYm3QGqpGy1m0+uPXyw==@vger.kernel.org
X-Gm-Message-State: AFq9FYJkkh/Eu4wO5Gnp9ZFC/PJ22k5Ku/ukWxlnIZmvHvGEQo0YZErw
	W0tbelIVlkLJYz8I0W50mucuxuwz4AIPZlQ5btDQHHwtP1YBewICk4GvVhNAhXc0XLg55bAkDXf
	c8PUzfaXw8tCyGVtDdUeoZ493uptB2eq1MqIbB3ci2SKPda/fYdU/UJk0lAzKbCW5zJYpJ3ya5g
	==
X-Gm-Gg: AYBFou2vMxPyi3qKB5Il4AH+QROfREDMh7Fw2dKsbtmzqKq4La15a27K1HV+h+g83W/
	WgvFxw58OStkopwIkJuLduLzhV3vd+wjsDnCWDL+BsJ4x9VsLT2E6mU/t8k1QH1DsGyqcrcQ1wr
	DDbLSaFqiHtiew5EhS5JIqAxwYmqmk5cYryS7OXuu63uKi6l0fjmhfufdQ1UCy9WDjN/jfdTb0P
	hsd22WTcUymDxDP7J1LJIMYi4zR0366GATNeYsjwd58kdc46ptHIiZrsjAzbDeQJ6kmZ9UImzs9
	8WfDJa9n8R+Gj2M1QH5FUVjOGAHxbhnCN4n/OWcVAwkbXObQkvQL0ggyyTPhRnyvor9pm+f6GLM
	O5a2iXrZeSIzyGuaXU0Jae9BWfgZsACZnqrk5pdfALXcIGoDibQ107h2z5xUUULSWITzcjBrrsz
	6t
X-Received: by 2002:a05:620a:4008:b0:93c:7d49:7b69 with SMTP id af79cd13be357-94408d42e06mr227997785a.60.1793182978717;
        Wed, 28 Oct 2026 03:22:58 -0700 (PDT)
X-Received: by 2002:a05:620a:4008:b0:93c:7d49:7b69 with SMTP id af79cd13be357-94408d42e06mr227994285a.60.1793182978265;
        Wed, 28 Oct 2026 03:22:58 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a976010ca7sm36225665e9.1.2026.10.28.03.22.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 03:22:57 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Magnus Damm <magnus.damm@gmail.com>, Ulf Hansson <ulfh@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-pm@vger.kernel.org
Subject: Re: (subset) [PATCH 0/7] arm64: renesas: r8a78000: Enable GPIO support
Date: Wed, 28 Oct 2026 11:22:55 +0100
Message-ID: <179318297302.16022.6984836476337905961.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1792776697.git.geert+renesas@glider.be>
References: <cover.1792776697.git.geert+renesas@glider.be>
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
X-Proofpoint-ORIG-GUID: rgcTfnNe_MtJaycWz10Y5zRqGCO2Kfda
X-Authority-Analysis: v=2.4 cv=HeuB3SE8 c=1 sm=1 tr=0 ts=6ae1cd03 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=0_pEspLTn5AsfqPZqEwA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA0MSBTYWx0ZWRfX4QG/dEYr7rV+
 7m9EXXP0wOP/9f9oikpB/20LBHzqmq73+8iO66rVWpAZuxN8BYZCteuddwzyzEE1fIdyqKuPBvg
 zhsBBiuJnPbqgjb6hYzqjR7j5ICySZs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA0MSBTYWx0ZWRfX3l63FvjRGBuP
 VdZGxtoUzFt4r5kIera6ejHXp3SdnMsPOrjF3P5ZkM7oYk1okpFiFE6LHWotpoMzejoSk3rd1ue
 SQM1Q86PGuj0HrwPtmg2gfmLupyc3mDxZpTVEpYMidXDt3vo+CDNKD3AR35/yThqOWo3jWRO0CK
 vTKER2/aieRcrfwsQnJvFpcY6VS6dq51H/Gj0QLt6BIC4u7c/3JUgddAjlxYGtygYSliY1zkfJU
 lwyJO1ec46prZlevsbeBH6rl2r8wam9NR/uBTg8MlpsT+kGz6Ev3eMiRuivpwUPYPfbbh5U/eAB
 mr5VHZEhcys7V+KT5HIkUFX4BT85VLuyYT8kJAHQWW3iCmgLraMQVobBtBRkC3Z4RQNcMUZ0grn
 KditHCOxjninVZi0Rdid3Ftrr4CFmn8fHBZyrNh3A4MhGxGVDICnYCekgND30lJc/dK/oG26PRw
 xJNeSGV+exuXN9ewXpA==
X-Proofpoint-GUID: rgcTfnNe_MtJaycWz10Y5zRqGCO2Kfda
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 phishscore=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610280041


On Fri, 23 Oct 2026 19:50:38 +0200, Geert Uytterhoeven wrote:
> 	Hi all,
> 
> This patch series enables GPIO support for the Renesas R-Car X5H SoC, as
> found on the Renesas Ironhide development board.  On this board, clocks,
> power-domains, and resets must be accessed only through SCMI firmware.
> 
> The series is a bit special, in that most patches are not meant to be
> applied upstream yet:
>   1. The first patch, targeting the GPIO tree, restores the abily to use
>      the R-Car GPIO driver on a system that does not have pin control
>      support yet (pin control is not yet supported by SCMI on Ironhide),
>   2. The second patch, targeting a shared DT bindings branch, adds GPIO
>      clock definitions,
>   3. The third patch, targeting renesas-devel, adds GPIO device nodes to
>      the R-Car X5H .dtsi file,
>   4. The remaining patches are marked RFC or DNI; the latter depend on
>      code or DTS that is not yet upstream.  More detail can be found in
>      the individual patches.
> 
> [...]

Applied, thanks!

[1/7] gpio: rcar: Convert to gpiochip_generic_{request,free}()
      https://git.kernel.org/brgl/c/5e826d71d4839d8471784d968274823f1f492eb5

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
