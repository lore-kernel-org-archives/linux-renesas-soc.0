Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9C2A53B602
	for <linux-renesas-soc@vger.kernel.org>; Wed,  9 Sep 2026 11:45:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788954308; cv=none; b=BvDdcpz6YUe6dOs2aFjjD1z8BL2Y01duUgd1penpsnafDzjuVNCdvBqBOGpUNS2lqVnBs+WQfyfd2jK2btJIpA5PrKja4KvlPRmEQicoEkFrMHH/CC7g1z1Se8t/liFdOqGe82uBRAKatxaebHK+w0N00F375SDHAcd6RvGDSmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788954308; c=relaxed/simple;
	bh=A8fbtECilXcXT05bGS4gADzn1R0DQYSuDpwR36o1s6k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OZd3IJn8FZFhzxQe67ZpvDXo99Zg/FD4IZqhTGCMGo8LEdBS4/O2ttjneopam9q36FprDqgl82kuSneppj3qrOVi/OrzWCf+lSxv5WROkQ/I3GPTWdt9uV8ZCcZ5ICcYYUM8vzUJvQvyMElEFSck8SgTcX1uGAzPwxTi/o2msTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UbEM89a+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KI6ZanAj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UbEM89a+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KI6ZanAj"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689BU5uY2653432
	for <linux-renesas-soc@vger.kernel.org>; Wed, 9 Sep 2026 11:45:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=/BIAcKnu4PYwR1yQKunqDZK6
	VZ2d055y4cTbs1O813g=; b=UbEM89a+IyCMUH8fbe/ZDcIHuOWqydmjtSVvoiPm
	Nl96voSomED5T7SASKY78Nu7lWVixAZfc5oOlFGGD1QVPNGU05kouUJmmwAk0DzI
	ATho82FJYipFdvlWvMX2yLKHcxHUQtmrRHfZCBGvpQouyFO0fdQXS1drVJ/Vfz6n
	m2w9swZscbvwaOUSZN7xC6Vg2wzGqV8EU0rrova5mF3hFwE3ei29i59Hk+IKYwKH
	LXcoQWt6bVQtuWNMf7LBf62Ppbk/1OEqmVOXPVKhxct1LZjbwg39uJnblC+7/oTy
	Rs23nM1smCaSB/QgBsIxnxKjYSZ+EqnmMgeV42j7QCvMpA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjqha3u6r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Wed, 09 Sep 2026 11:45:06 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93903982af1so1203455685a.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 09 Sep 2026 04:45:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788954305; x=1789559105; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/BIAcKnu4PYwR1yQKunqDZK6VZ2d055y4cTbs1O813g=;
        b=KI6ZanAjs87Q1iyZuqy8majuKCOfilunk3s249v8AhXFOLVYYcEwwziUkSRGjT7v/M
         IV8o4p8StgmUOViZmXsqSQArPvPCW9EzXJh7ungoa0aFVkhpXge/fKAcGAWRaZ7SBzdH
         LUuSg3ReH/d9NYrpieC0YseWsTXeg5LQVtLLffakBKwYTvI35+ecYEgyVE47MtqKmKId
         QoQpwy9qOE22gSuOersakhKS/rzCiCVb7LSF/9EozRA8ltiDYP2vaziBuOTjhwy7KJsE
         SGe/vel/difFToLURQ8K8xp7RQ5SENyK273J3+JaeBk8Slj6XrEzn16OqNZO3Q89wUlx
         Syjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788954305; x=1789559105;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/BIAcKnu4PYwR1yQKunqDZK6VZ2d055y4cTbs1O813g=;
        b=LjuMKUpDE41jUF3MH/e76f0i2NXzou4U77MqyQ8ysBpGTIOVN43W+CX9HGZ7bMB5+f
         KIGX4ekhS1BfwSK6jM7H73g6EOg9CzAvqpbX+U8ajnN5DUAQyqB2U6TFpu82FtA2mBHY
         0QoM5Ux7YAP/Qoc68uLpZjykXGi3dzuRC3T0HpPNs4T0M6SriuonD+wKphT+xQ7XG+7m
         XlJAwM8GTX3LgAPhofwP3XWY7gfuj9UhVfIghA6UjGQWRIaZ0I15fs4QERyGcGHUrA4X
         1qSz6EA5z0c4SW4qziIFN7HRRNpbDIA2ZQKG0KixXN459aMlFyCIafQAt+zUiR2iMS6L
         5YmQ==
X-Forwarded-Encrypted: i=1; AKwUvByqfr8tVBSejGWFqy4H/6StwFU+UChlXWakGS7TIF6dII4ZxGOCAWX5nb1+Rdx4OWTRzwRQ7ZjCTC+r2BnaPEESeQ==@vger.kernel.org
X-Gm-Message-State: AFuF++lwAUwu0Md8h5hyJHzWmoAKPe8DZn7Rl2uE+WgmauSvegZ5HyTI
	lS5mEn2ylTpxWh/SAhaY9Gl/jvm+eq/AAG0U2em1cEobikSIeEKedeGDYsyO25AFx1hcT9md1P6
	xkU1NcC7agLOuDqxC4H36dvneRpDFzaEO84meTsC3olUbIVlPrcAUYRpseGIZhoXqCRSahZoFRw
	==
X-Gm-Gg: AYBFou1ewulU37wEoCL/sk21TC0NpADFUUXJbEMr0SuwDov3TrIwUFa7TY+VRN7lRNQ
	MhtZdFYBWdl7s2taWiRA7jr8kDqfwWJKPG0/1iZt1joj7nGB3Azyvw7fzMr/vznR3a4th9+OKdj
	Kg5VlZ0PAJVj9MtYFzGbUQGUNuijFaoUO3BjuFj4k1eV4QTLWgSN+bNLhFDiGKQIrdZQOMxTmgo
	CrzOsHj/luX8BtxVHf67CTAR2gb21FGcdp5PauQZ+wJR3olTW8yNRpgFmYqMx9p4F+iyheD+lA9
	hh8sP88hbUOJwLcG3TMcQ0IbyXxR0Le29k5Di4FMVH04lJGqoaI7H+QQjZ939uT0sU+9EvNgdrF
	X36zVwttWzCY=
X-Received: by 2002:a05:620a:a402:20b0:939:989f:3371 with SMTP id af79cd13be357-939989f4ac2mr1934359685a.52.1788954300112;
        Wed, 09 Sep 2026 04:45:00 -0700 (PDT)
X-Received: by 2002:a05:620a:a402:20b0:939:989f:3371 with SMTP id af79cd13be357-939989f4ac2mr1934353985a.52.1788954299549;
        Wed, 09 Sep 2026 04:44:59 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.7.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d1fb02bffsm40029685e9.0.2026.09.09.04.44.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 04:44:58 -0700 (PDT)
Date: Wed, 9 Sep 2026 14:44:56 +0300
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
Subject: Re: [PATCH 2/4] driver: core: platform: add subsys_platform_driver()
 macro
Message-ID: <eu2j6ohmt7yrhkvfcwiwfdcsebezdi3rr6vokc3t44ynfucuew@633443hrwqwf>
References: <20260908-subsys_initcall-v1-0-cbccf4cd4288@redhat.com>
 <20260908-subsys_initcall-v1-2-cbccf4cd4288@redhat.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260908-subsys_initcall-v1-2-cbccf4cd4288@redhat.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDEzMSBTYWx0ZWRfX5+nNbVV0lKtG
 01jgC4MpyBV4lzTmB4JkCMc//rxmAnINJQPeo61Aq9qaM6GHcBvoPCzyZmobZCwgsRNCEkc4syO
 DtJAb96nlLTmbZH6SnZDubS5rU8MQArSNpy0BLPjI5hRRFTjBSF3oig3rEjPf2jmyxHNwsKL1Ou
 xvFMx2wCYU1u1V9csavLCT1wVVpcAUE3xd+slILgrHXnzn1dSNP+F+Mryqr2jomb3zMVCpDR/53
 PSM9WRwvdyUesUF8zFZ8rTedGIxiXAOb3zblx5CO8QpWLM+bAVyIRRBLOJSQBphqX0H8VtIKuli
 wtZHal1VkUz0hVQLw/d5WrEII0OPN1AD+VrGTeHqdEjuLXdI04RRN3j0YKwayts4FPo2khTU/sg
 /XU5hjqV1zrs1Uzhq5w/yHlZOJXMDiMzYvcjN/YJ+9et5wYYtv0//zuGcz4HzBICGqy27PymnVD
 v6VRnJzdtLLekBy/euA==
X-Authority-Analysis: v=2.4 cv=Z5Xc2nRA c=1 sm=1 tr=0 ts=6aa146c2 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=dePp4Gl7O00gmbwhyVsZwA==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8 a=7ud9App8h0w1rxOIwrsA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: 06JAwVF1kUaWTh3mZbBpZd9Zbb-KrGok
X-Proofpoint-ORIG-GUID: 06JAwVF1kUaWTh3mZbBpZd9Zbb-KrGok
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDEzMSBTYWx0ZWRfX9gRdMyiDylaE
 9kSJpWW1xN7SdmtT0O3EMlVfkEzk3CUpTyeNyhUrIbiG00HtvAXKGtOfY1g3DESuNnwnFtHKJRM
 eCMSUsEBpSdAanGw+/1Sbgb1P4lQ0Dg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 adultscore=0 phishscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090131

On 26-09-08 13:47:19, Brian Masney wrote:
> Add a new macro subsys_platform_driver() to eliminate some boilerplate
> code in drivers that need to register earlier in the boot at the
> subsys_initcall level.
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> Assisted-by: Claude:claude-opus-4-8

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
