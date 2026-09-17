Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD81F4B95D5
	for <linux-renesas-soc@vger.kernel.org>; Thu, 17 Sep 2026 09:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789638991; cv=none; b=rIHcWcA6Ym96I8cj/LzLQVL+xtEyO8yB/CUYDwRg/jX8R7kG1tqCITDkF4DDJc0Tbx3kSy7jemeilJLMjqmq8e4ENka5eSSGOL8KBU0OqqSQr1aI4htEQ6qHgAyQiZU6UPqDSk8W3TOm7h/cvzdldBUBf2ugRQ6ssadHK1QPm1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789638991; c=relaxed/simple;
	bh=vNfsDwKYooX0vfo3ekVZN/TR/vUknbQ5hnS58EH0DzE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LVEd3v7u2rL0EpX1KiU8zbZ4X89SiwOgdjrC838+NkskG/u6l6Jm+VPRQPSOSY6cMHD2YN5ITs+noCXL0CtahRrwLbHvTTk20y4Cw+4j91ulPBh4yQ6Jq3Ga0rK7rjOicQ3Pn+1S0DTE1jF+XcQc5AfxxAax6M+9ZITt9j9xLrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GZpoQXyI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YQtyLRJk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GZpoQXyI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YQtyLRJk"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H9ZVDS746431
	for <linux-renesas-soc@vger.kernel.org>; Thu, 17 Sep 2026 09:56:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2X5rbhkv5+LAojG3ViIo5s8m+sLl87YGBKDP+uClpoM=; b=GZpoQXyI2GpLiLMg
	roUYsDFcANMLND2W+ZZrZlUd4vvKdQjHhPCmJVbG6eg42N4yRfKFzafb+L05ir7P
	oP3vcD/TJLKO7oM7pRe8gr4AZOrMDoY0ibpp5QtZsNmLmq4lKCTPO1C/yfFcr3MF
	RCzFZ2Vbhm4R7PAVVFcf1Jn9BhMLTNKTaEzIb99/Gsp462wVOSarqHWeH0UzMehx
	LsocdEjcT3fLNgL+BQMWBh4fJ1UHdvn9WqO7FUD4X3822JGPHwDpJIRtJu0uYPRf
	GLH8REmO7enxk8llRl/sy6doZ6eEkL3gbFa9gSdIg94jE3JDcSpnh9f8nT8A1t7L
	e8kIgQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grcra8at6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Thu, 17 Sep 2026 09:56:25 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93918756165so112356285a.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 17 Sep 2026 02:56:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789638984; x=1790243784; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2X5rbhkv5+LAojG3ViIo5s8m+sLl87YGBKDP+uClpoM=;
        b=YQtyLRJkuzsxrIj0SkRvDnLU5OReZ/n0zy/V6PWxZkxd9C+L9wpWj/CZf9LSfLSIJB
         INhOdNSyk8s7S7O4OwRIQMyHyiZeJ/j9Pa/YK8tabH34moJRDOvvh4V01b4QtZWwjb7o
         Vey4c4NSjp+9HghkSgJK5nSUrQUoGcmM1rHHb7mXKMTQRujuX+rF33p7ckuFdBfS5t6I
         AqlY8kOnhmCEG+g5OzaICByeIUWmJDcB3WioLq7/PAYDQY3TIySgCEjUvfW9lpbONoHy
         FcAz86WpK0/NTiapwHNEWns31QGrBJXWZBHYrwQ8gMJzu/TgsmvMc2N36HCsuJdfHKDU
         EDrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789638984; x=1790243784;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2X5rbhkv5+LAojG3ViIo5s8m+sLl87YGBKDP+uClpoM=;
        b=dnyRZQEFlxqBlSEzxSzZWeRuo/AI0DbP46f647qqu1z01N4bwLzqgd8xwGkI/t74HE
         5gJCIc9akBnUnREi0QPhoPG74WB0ZaTBvuLwZvVYOplT7UHdWP7pJdH+or0CiP7ToKQH
         xUEujl8prluThGaiA6MnFn1aOIFqcPXghVjTskAkoSh7bTgwbyNdi/8lqTSvc2sPAEt0
         JDk22ML4kYx9IoOEXzM6VzaPL9yY0l+gqqWxcwYivwYj/lNcjGRJqNJT/nJtzBckbZhY
         9BWHIjmNGxb/HsPzoj0khvpE3NS7vlK3RsZGTvSOaMfGGyOHzbTbRXO7JfHBFmNUQBFl
         HHnA==
X-Forwarded-Encrypted: i=1; AKwUvBzPdYTgwW8tudVir8a7yAfoB9JCLSU5GSdlf1fzbbRAY3fGnxpCs9+QoSxM/TRpW2Ab0U4c9VcBspSzervzX7q7sQ==@vger.kernel.org
X-Gm-Message-State: AFuF++kLfdqmVYNo6s0ziMIPSa0mCmdY894WH6Le89Lkz+vzoHZURjf6
	l3yj8UosDJlS9vpQAUGCpUzWujcxIFHCZeo0LgudZBHF3sUz3MLlv9n3HgrxP83Ro3RiVDhRNoX
	LqUQlP/ghcQ1i0UX9syUxIFFAJgdXaB/zsfgE8ccfhZegWeGj63+ARqnd7aLdqn3lVDCXe85VKw
	==
X-Gm-Gg: AYBFou0zjm7k6XDieh34TYewHDEWpwzOGjRbH/z2BBvvjQeExY9uPwrK1a+F7+cPtry
	F9M9meVIyFvwb+5CCjNJWRBNm+jWnHRvzshoUiUFcGj4aPvkau/b3MN/h3l6/2ZGRXH5HdjvX2A
	aJAGSIBgyLEziJIilECUNwfZGzrMitqCe0Der9MXptt1edXLNQz5fq35kE7BG5kF+sc287b8/4T
	hWgl+jyA7s+Ggy/vCqdfOGKP2Y8XRIw75D8c6WmMLkoDI2dbsHBR3ZDizjIqhd7/9bJZAvXzcJy
	xTYeuvSVAD2V9pTbautUgSxhNUNOrM7INNyELG4SzqkHGRT34OPP5YWduar9i2hQzRCfAotXAiV
	PPvxQvG6tNj+LFheVquWRsoD+x7s=
X-Received: by 2002:a05:620a:2547:b0:93b:b4e0:1c89 with SMTP id af79cd13be357-93bb7909a8fmr1023014485a.40.1789638984128;
        Thu, 17 Sep 2026 02:56:24 -0700 (PDT)
X-Received: by 2002:a05:620a:2547:b0:93b:b4e0:1c89 with SMTP id af79cd13be357-93bb7909a8fmr1023011585a.40.1789638983683;
        Thu, 17 Sep 2026 02:56:23 -0700 (PDT)
Received: from brgl-qcom.local ([90.161.207.100])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbd24774esm99701075e9.10.2026.09.17.02.56.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 02:56:22 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: linux-gpio@vger.kernel.org, Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Conor Dooley <conor.dooley@microchip.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v4 1/2] dt-bindings: gpio: renesas,rcar-gpio: Document R-Car X5H (R8A78000) support
Date: Thu, 17 Sep 2026 11:56:20 +0200
Message-ID: <178963897745.8494.17988648370615095613.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260917035438.523010-1-marek.vasut+renesas@mailbox.org>
References: <20260917035438.523010-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDEzNiBTYWx0ZWRfXyoZ+sM0P/4ts
 FLhzWFDSlIGOZCQfBLZku63d5rZWzdDi/ipXjbIIAb+6/AIiq6ufvteL7SmlM5cD51vwUUilRTp
 S5MoyX11wT1qKW3yDeAIGOQvq7TCalM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDEzNiBTYWx0ZWRfX31MU3GERshgk
 YtXP/2oy1E9AjFV0LiK106RlmoQlgMgNu6eZzsGDv9QqqDL0Desp23+f+AA/oiksEViXS1LLRbL
 u/e4/RHJT+rw7iTl3AWmH2sTEqPrjR7wWUQ+CbfrvOE1R4D3k/pkdaE/6NNPYMZsd+IRmBBEP09
 pwbfbGYIjC9vbLddPfBkrTojFkExXdzY+emTaCKtBOPGGKuwYq2EcxZx/Ja84p3GozrWFADAoFq
 w8lcyFZivbVn/ELvm68TbvcPCTAN32bJ8kkrFFCZsPk4q/saMzjgDPcMC3edleMJDcYpYDjbnnw
 0G8O+MJjrjqH7D2xTNa3Wxb2PFtFECRGg16MbkKJmqGXndfT9SHPx9qFvyj3K8kpq95FY+NJeK0
 LA0arZsEo3tdTdrk7teRGDLu6PRxxQWUOx66zZ/onTapIgW/pzEFMJQ218+dnvL6oZtFIZ4KUbh
 qWRYXsZ9CSATE3vrHdA==
X-Authority-Analysis: v=2.4 cv=WL/qzXsR c=1 sm=1 tr=0 ts=6aabb949 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=BQ2oiuy6hHN+kKmom1QVvA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=PEkeK1Ut5SyvuImKavsA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: WvmLQKcshGdjdcS8IQscsCQdA_Z3GYG5
X-Proofpoint-ORIG-GUID: WvmLQKcshGdjdcS8IQscsCQdA_Z3GYG5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015
 malwarescore=0 bulkscore=0 phishscore=0 priorityscore=1501 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609170136


On Thu, 17 Sep 2026 05:54:16 +0200, Marek Vasut wrote:
> Document support for the GPIO controller blocks in the
> Renesas R-Car X5H (R8A78000) SoC.
> 
> 

Applied, thanks!

[1/2] dt-bindings: gpio: renesas,rcar-gpio: Document R-Car X5H (R8A78000) support
      https://git.kernel.org/brgl/c/373c23eab4581c653e875257b72dd239fb64b738
[2/2] gpio: rcar: Add R-Car X5H (R8A78000) support
      https://git.kernel.org/brgl/c/79ec1b1b33242fd58865a56c1565be5c1de0e837

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
