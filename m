Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4985D5328DE
	for <linux-renesas-soc@vger.kernel.org>; Wed,  9 Sep 2026 11:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788954278; cv=none; b=KH0Nq/l6CeHUrjw09LKpNZp0VhGdoch3My//Po/OwkYYmHOiH7/DhY6pi21V7BXwqLXbH8iM5nI1OzTOxcrYQqbBAtzLAyHrxMYUBD2WfYTn/7retEZZXsN7/rvNlXJ+j3y4iV0Hpli6ws8wq9mVhRPtijR54SUCOXbm8zEgmiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788954278; c=relaxed/simple;
	bh=Q5ojKNKo6HChrWiC/HJMJ65Lk0CfqxwiOcXmEevOK60=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O4AZGCd4K7UepBYHTyVkR7TZxOkUTOFK9l1XkN7KpTgCh/Vzx/t0vJWZyWN3BJI+s09wsFEovEtHfNar4I3rN8T51mozsffWkzL48cszYXArA8kaNxzn5TCSEv2REocixG5Kcm3Rf8PSWipkTYvKyI0EKMwe4/8/QqEajWfkTw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ouq0vNez; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kAK5a99x; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ouq0vNez";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kAK5a99x"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689BU8mB1723322
	for <linux-renesas-soc@vger.kernel.org>; Wed, 9 Sep 2026 11:44:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=8Z3vxjDucbkBUn20X6eQMjxa
	kCQuQENAXW25c7p6duI=; b=ouq0vNezVu/DefF5uxtof0cFcCI/P9C4ofAaFR+A
	k7QhiVC9Wx+sm1bRd2yHVPp7Lwz0TFC48ulCHzLte53JEOlC5zyTzJaD6SRz4DOj
	fqLqNJATKIMTFJAKg3nLkHikMFm1q/VS+nMRDsyn01oAjUDmmw9lE8Dc0Ianodle
	ctsvzS6U8mvm6WXdEtCW0W09RBSQO4DmRI77eJWasgvaXEIg1xCCQjXZNfh6SjLb
	c0EBY747Q8VBfB+bWD15oBk7j8DJXF7MQrGwX3NwAspYv+sIlgipkSJ1FFNJlMZq
	oKch90bDYNGhh0NcYsDMM8kRE3weuhz1TI15YDulUlzkmw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gk5cnrc7g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Wed, 09 Sep 2026 11:44:36 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-938153538caso890636485a.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 09 Sep 2026 04:44:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788954276; x=1789559076; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8Z3vxjDucbkBUn20X6eQMjxakCQuQENAXW25c7p6duI=;
        b=kAK5a99x5t8DAEdyoFociCrb9pXxFZyHuv4kI7M6wUXykbm8yRopKk0rv5W+y3VTf+
         LlYwrDtKNCiuYZSxULZrV64F3fPC+6+3taOcrXWc+AwrKlZm3AJVPf7Za4mCZuZIuJn8
         7SeOSex/ZyuU4ug6/tv9kkC/540q2RUpsGljqhl1cW6SlXONxejuFQjYfAa+0oeXR5CM
         zKgnW2R391MgCucSfVMxy+HJWxFK7LQtV59sq8EwuE+CW6Ci0r2sZYPVDEBGpePmbjG5
         CTvT9TJomsZJ7SOuy2BeGhdGhw5vrNJU5JeGseahfeTvZeag/wk90jqOGSNjrkR67boC
         eu2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788954276; x=1789559076;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8Z3vxjDucbkBUn20X6eQMjxakCQuQENAXW25c7p6duI=;
        b=md+VrtT+ADSE6xEZVi4FifrWT8xCOHAnWhsah8THw8itMPq1jxC8Xh/Dzz5rg4sUZz
         bpcrxVm3cimuUO+nGzYxYXjKkpOQCy7+2VNsWSyh21Co/zCSydXFdUjU69kZqv3RSGkP
         FLaeNA/rNxnwMt/F63wtANcp8orJlCBsFp5ODaXlwSqReQA9zHgjuvcAwS5RaEvaS/Zd
         WBBkdTyw7nagp/1ljdGm7/I2FWv9+HLibcyv3IlzrZjJvRsuCPRix3bNvbGSoxX9dW1U
         qp8JBGjnQQZIKG+1FHs8TXJrBJegKCiKFL5ceHQo5iil2MxlN+FpUuis9YvFmvmTv2b6
         COtw==
X-Forwarded-Encrypted: i=1; AKwUvByoWLntH8UkmdJb1hZQ/sLRaOcLvZUq0RXkq499LJsAOk22d3ZCwGSbGIu+wIty34fD5MtlcUE9D2ynzxumplpeng==@vger.kernel.org
X-Gm-Message-State: AFuF++k7gVILE5/XBKJm6L4nx4DDHfZSzAebRM3qoficKEij7p1PbWUf
	qukGuEEAswqRX4KG7SkHyi1/J7XJ8q6NIZaUlr+koEKLPX5vrDabPoOL0u3D38wnBn1Ik2Bt0jy
	2dEcrKbudauTfWasYn15tXRl9kA2GCnD+hCNMNM2QTosuvPdGu34MGdSp6vgzb1muegRyCMtB6Q
	==
X-Gm-Gg: AYBFou15IBnKr3q41hUytNptIpDk3i0Y1vzDnuEjV0L8TaeE6VDPdEsW1x5NRo9QVcT
	Suj3LpflEdJvvqx5slhEx0Lw5qmA7BZrKW+wssrQk7rsK6PQeHK95/lisubR/lP4w9M+p3KClDF
	AXPnki86VOrrnMl/tQVU5mAJ6oT4jM5O/DzUa5sSqSWtxDNIRtkl2iBjvq6RvcCMYZDXUPqN6as
	VfxwSJpzKOhVI+KZIo/IEQDlyxxaYWGAzvBcSWFGIRgZEBFmfmWhsmb+lBDx6O8plFCnNoii4rp
	qrGqSkBeyl53px9ob7mgFPyTgXbG9WOXvkytawY0ApOTwaj50XylA+zC3n0++oYEOAwGEANyLTJ
	neYCIA9gd7kUx
X-Received: by 2002:a05:620a:aa01:b0:939:35e5:94ba with SMTP id af79cd13be357-9398031e112mr3614855185a.6.1788954270661;
        Wed, 09 Sep 2026 04:44:30 -0700 (PDT)
X-Received: by 2002:a05:620a:aa01:b0:939:35e5:94ba with SMTP id af79cd13be357-9398031e112mr3614849985a.6.1788954270227;
        Wed, 09 Sep 2026 04:44:30 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.7.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d03543064sm374791805e9.13.2026.09.09.04.44.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 04:44:29 -0700 (PDT)
Date: Wed, 9 Sep 2026 14:44:27 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Brian Masney <bmasney@redhat.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        driver-core@lists.linux.dev, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 1/4] driver: core: add subsys_driver() macro
Message-ID: <jer2cwmxbsvbcyyfjk5vv773alhivskfhx3yah2biemulszknz@6ievb2y3f6ot>
References: <20260908-subsys_initcall-v1-0-cbccf4cd4288@redhat.com>
 <20260908-subsys_initcall-v1-1-cbccf4cd4288@redhat.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260908-subsys_initcall-v1-1-cbccf4cd4288@redhat.com>
X-Proofpoint-GUID: 9vEh5D8Ve9qA-uv_tflo5GxpPxVUdJGe
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDEzMSBTYWx0ZWRfX2MHTCVDZZyFI
 F/e98ngM7z17e+rtyPAvbchTXMT6Lo6x5p9C3IcPhKTcauOaktKmj9f12v54WhwcR7nAwukJ8zf
 II7wG6cUBs46GtUflVUiFY4Wsz9CRhw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDEzMSBTYWx0ZWRfXw7AjvsTz3ub0
 rKwe3p+j8IFP/DkM8LDUDH4MvveD8JTex77X339PuC9ZOlonkopr2rVt9Rt2tjau4a+IQo8yp2u
 eJySCz7pYfcmE2JBfWyUtJ+7MGPk4x0wIOeqwPGGTmU3G5vnVpLFAYVY50KaffQ3ocPjDK06piN
 5yrOKpUlkiqOsI/u3rslRSqvbfjPZXmtE+pE7Z3Bj8NkIZsiCAhSNzMgzM4qz9wOkbJYaOaRgKR
 N14AKqwkwuHrU+p/bzWcXSXlhPkjJVOWb3l4ZSJFpQwdLP7Xsx9Baith+wBjoduLcYlLF14Uz1E
 CtvCfgnsJ34Cd9BqCEJaL9ubPIhaf6U0E3StIz7RoHSYzV4tza5xoVQWu7dTLwsmqmWDO6RAc/2
 IWdnqs+UmW/JuK4GBd5TIdHtU1oa3ryqtmnH07BFCZl5c2UMe9/bL0mMs4GIelNLZ92kI9AzPHm
 aXj0ebI9vEZ5bkh6GyQ==
X-Authority-Analysis: v=2.4 cv=S+jpBosP c=1 sm=1 tr=0 ts=6aa146a4 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=dePp4Gl7O00gmbwhyVsZwA==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8 a=efGZWcCWKF3PpBPhZoIA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: 9vEh5D8Ve9qA-uv_tflo5GxpPxVUdJGe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 clxscore=1015 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090131

On 26-09-08 13:47:18, Brian Masney wrote:
> Add a new macro subsys_driver() to eliminate some boilerplate code in
> drivers that need to register earlier in the boot at the subsys_initcall
> level.
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> Assisted-by: Claude:claude-opus-4-8

I like this.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
