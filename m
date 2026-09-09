Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B871A526A8C
	for <linux-renesas-soc@vger.kernel.org>; Wed,  9 Sep 2026 11:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788953109; cv=none; b=LyOzAcISZWX36r4EdEyQ1nWpaTehEhumAuksHeGXQmmRgM9EFYvzgzMOptdbr7oef6sDoCN71cGriB72dxYBFjZvH/0baqFW8YJi/eNl7rnrLZ+DtiP9aFv+cxr6Mt3Gdk6O6AI1AlKl6Ega8jTd1WGXLxO9owjfJZyAleqeUHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788953109; c=relaxed/simple;
	bh=Z09T1KtKmhwNLXiWVpHaJc9LPvi/1qHau6NWWjZF04Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bViIgc5Ize1dwah2kGO8gADrP9giK/2V/NHYGxdHVpFNiKTY/tVFB28QUK2dO918Ih4rTzx69NSKckLkG8y8Rq0Rq7eptNsvzvhQT4Yl2/OdbWYpGtS91j+gsHQCClxbGr7B3iQBLw5G10GTpQLu8Qn4hdP3P/BH7lt0GHB3MYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kvu35bdv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FEPsbGi9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kvu35bdv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FEPsbGi9"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689Apurb1639518
	for <linux-renesas-soc@vger.kernel.org>; Wed, 9 Sep 2026 11:25:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LmygLzWOfv5qdfrTuFBPJrVJYdNWjT1c7y/zoAmNeWQ=; b=kvu35bdvj/2kTlnr
	AmEQcrS2WB3tRsgh3yjrsEXxH4quAHR9QtFzNCeisv/2PaZ9vXe4D51oR3/0PDtD
	TBewfHUy6GzQvW/8aOwW+ABXkzA3TskbuJ9l38r5ZIOeHHtQnKUkzo9vUqFEM0Bp
	KLABwX8LUA7loUJdhZmvJKM5mo38M9qdUo/bUusVf5dYjwRimfR0HnSjaxPlq0bL
	IZWJJSD8cttC/p+J8QPeXpVcZauWndKY6+DSGa/L+9+FXAGxjArMkgpaAWTI47x9
	ozQS8nZmxbiediOZTxetvFW7fxmSk6SKEig811q4vSbRpVMuPgRuhfjfzpNgq+PP
	iKpeDQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gk5cnr9qs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Wed, 09 Sep 2026 11:25:06 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-938fd633df7so75095285a.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 09 Sep 2026 04:25:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788953106; x=1789557906; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LmygLzWOfv5qdfrTuFBPJrVJYdNWjT1c7y/zoAmNeWQ=;
        b=FEPsbGi9hGj0d2AATQNExfHwK3/1lgW+hbYYe/4t9OfLK0UVh9d3mG7QpTEWJHssH/
         ZY2vDIkfmNy2kUa41XVCiz0UBytzZVby3DHCYHhe5mkXrmzBRUbaacSih3ya6dGVm5Gq
         HylThGHX8Vg6jxTGGKhTiMlHSIrvl+RbPGKS5FwhxgRbyXZ/FwrI8CpB+dyPNfQHzvwR
         /WIuPjDJe6SwFEdZpR6OVwR7eRK7dZx8vRt1SmMxm2GrDmJ1LB3+KFZgKr9LQ7x82G+7
         9CzZ9j8x1yziptjskqA/3Nim94OzQjRJrEHbPUM/ltLT0KVluvWf3xfxmscqCgOku7q2
         KF/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788953106; x=1789557906;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LmygLzWOfv5qdfrTuFBPJrVJYdNWjT1c7y/zoAmNeWQ=;
        b=AsLmguE7lbrgazXNcph2HpldFH2skMBG4lc/tAbjXQaesPKVFsw7Vjv0092/B79dqI
         JuxFoPRn7CnHPOiqxi4OOww1Ze7TrMKrBDKyb1wTieDIxutC2DEDaHmKQBlkyYa58lPv
         C0MDNa/9YJpQ8xN+7futY7B3UaakKnIn3zXl0q7UeRyoT8btVSVLHVPA2ARbE5hYAMQt
         9b5SNWpuH97fY3EwZobqLJTEr6STp6kfUNfZJ5beHUZJ6u5kQp0jk21fWkWGowBb/NtD
         PKVjfMuvdMFssqhqd4h2nh+8Mf/05+h1kAptia+1wTaqvo3m00g3ljPMmXKVKlCiz7In
         mr8g==
X-Forwarded-Encrypted: i=1; AKwUvByaPe0pLAFtazNq6Q83lHYeEzC+GhxZhYBFVVYxXoNovk8nRdIqps7q/QyLnJ6bkxOClbqoc/2qPkYrsyd+v33zSw==@vger.kernel.org
X-Gm-Message-State: AFuF++l5zBOegjTKRD/rzk1IbVC6o9uILXF5dtlveHVnJEybqK5zsfpc
	Ts/pInbMqIqxOrv4rv4XPFymy6fQytxMD9OVbGpQJJuDPFTQMevjSgHUgRoWjDUN+t7pjFUNrnl
	+TiYtL9w2XzQfZMq6rGEU1gLSDABWDfDcdQx9zegkCtKsuFzTMtw3N+6+F3lukcLbXFffW9pUmw
	==
X-Gm-Gg: AYBFou2u2ZPs1J0VautzSlKly8AizApmDylL8mFItnV2/sz93ngGLqhpD7/rJz9K3Gm
	muTVGtJjGf5NiVVLLDOrSS8y/V1z+GjuXLYjSuKyY4nCnr0Dt2neYttCwC5RP2vHx1P89ZEl1TG
	3pPeSJOslYhRx21Z/I6sekhb0No8ZjVfCrhQIxLfvCOTYvHs1WkSApo+HvcZdEE2nJz+jMm2h+0
	iRVoehV5m9MOejIUNG1fORzstXhONdQsXffcDqqGuSbjbfdzcNTo/eRMO6DH2BfI8c5pl4EpChe
	lB4FhCVHXktnn7kz4Dl2TYJokewuDip8+Rp1sLU4TqwZ+aZvBE6Tmfs1w6iGg2G3v2+1hLmTbf3
	0YnWUav1/doTqwxCwB8A3Cw==
X-Received: by 2002:a05:620a:1729:b0:939:c8b8:4639 with SMTP id af79cd13be357-939c8b8467cmr560512585a.4.1788953106003;
        Wed, 09 Sep 2026 04:25:06 -0700 (PDT)
X-Received: by 2002:a05:620a:1729:b0:939:c8b8:4639 with SMTP id af79cd13be357-939c8b8467cmr560508385a.4.1788953105607;
        Wed, 09 Sep 2026 04:25:05 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c26e956ea81sm545162766b.33.2026.09.09.04.25.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 04:25:03 -0700 (PDT)
Message-ID: <c15d4fdf-0e78-40e5-aeab-56692623b6ea@oss.qualcomm.com>
Date: Wed, 9 Sep 2026 13:25:01 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] clk: qcom: convert drivers over to use
 subsys_platform_driver()
To: Brian Masney <bmasney@redhat.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Cc: driver-core@lists.linux.dev, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
References: <20260908-subsys_initcall-v1-0-cbccf4cd4288@redhat.com>
 <20260908-subsys_initcall-v1-3-cbccf4cd4288@redhat.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260908-subsys_initcall-v1-3-cbccf4cd4288@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: eFfWBBCBpwz78L4adQADZjGMPibedxe_
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDEyNyBTYWx0ZWRfX7B25dOnggd7G
 27+xjJ2X7KMXqMt4nHcDrVH5mRTbDvAqEjSf5pD8CtpPWlGxxEfxxFkcOK/U7f7WCuTy5Zyp8rp
 Bg0/YA+/N/07FB7edEMHn55Id0MTZe0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDEyNyBTYWx0ZWRfX0XBKTnRppv20
 envGrmUifyRaEcaKy/QGNk93AOW160Av3tFvcc3l39gEDgo1fHR5Do/CMhC0+EuDtX1deTIpag8
 VsNW0shqMDPGjPPqHVV+kz6UtB8rC04UscivUNByXfvBep3CUuX+cWiB9f09vDg+ATTQeqeDAKY
 C9fXQ0zXkEgNY4J+rse5gYAXYu+U+A05NIBkWIjvFeVF9r5Hcw72uniPDgncIo53DPHjudbOGWR
 rofjFJTmglY4706KFetcM1V/pew6d7ssBQk8v1S8esMfy5hX3NBwq6fBJvafNbNVMk69mZK1wri
 BjJXb9KvGMTnubOKKWurNpsQ4p4HkMuvBCQUav9fqqqJLDMo3EXYb8p2P7mAoOFxH7+mx2EIP+d
 fy/4/Hde2sJ0inwDPerg+wEpx6hNOruc60wAO6S9OoTqJwyhHoXEAUWslbq5ItMUjoJoL4uB6AG
 LMVYTdB7m8R8XIE3f8Q==
X-Authority-Analysis: v=2.4 cv=S+jpBosP c=1 sm=1 tr=0 ts=6aa14212 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8 a=q2Z_u8HKrAuHhouZslcA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: eFfWBBCBpwz78L4adQADZjGMPibedxe_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 clxscore=1015 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090127

On 9/8/26 7:47 PM, Brian Masney wrote:
> Reduce boilerplate code in the drivers and convert them over to use
> subsys_platform_driver().
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> Assisted-by: Claude:claude-opus-4-8
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
