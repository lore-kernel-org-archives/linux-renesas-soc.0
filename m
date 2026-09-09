Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C308C357CEA
	for <linux-renesas-soc@vger.kernel.org>; Wed,  9 Sep 2026 11:45:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788954329; cv=none; b=iMQC2TVP/BIS9gWpk7KpXRE83ypVQ/wY8CS8M9g1PS6Y+P0exYaBg37Tw/UADCn31Oc3bg5UI4d9H6oPvM6D+3qFD3CI4umoxH1AKXVzpeuhCgCpUAYCYfO8ROyLxu0d1+w+YXmXsRVAzKPyJbg5aO9YbPrvh4R0Kul4PBXHADI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788954329; c=relaxed/simple;
	bh=w8t0PcgJAx9ctFVVcRI8rM3BIltwafJlxl9b/hayqeo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AEOfiOkc0+j9Q/oudcYqKujq2bv5tyFjX/D6PZdmG/FkHp4DurKyCeRN0P2GMa0nSTWx+dlhPItNCZBSrQNhwa0Cx3U8M0XS0EM0krVOv8fqW5ZQRoGkY65khbKH6kQ65RZ1tLcpUl/fjV6Ju2/RNKpiKSm8Rq1ekfa4wCEext0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WVctFaCM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i8c4ONAq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WVctFaCM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i8c4ONAq"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689BUCQh1843087
	for <linux-renesas-soc@vger.kernel.org>; Wed, 9 Sep 2026 11:45:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=xZd03ZLm04N2hieg4Jz7IpXL
	9lB9dSQLJ9uFkAaXkhQ=; b=WVctFaCMOilWNlc2G3VjyRltEj9cnMnJrXHG4PRE
	3iBbZuR2pwOkRuoowtaf+axjvSB1gbBmVr3VJh4xugJ45VFFezVSEZ1NfqxdxpT9
	1hYut6M97u5llEel2Xtp3bfqf60yRduELQqSPf2/S8mNi7NCLJPQuhwPW7JbliFB
	8SvmZjpWb24yxcJgOH2GZgj/LajfuywIoc5M2XhyO1szDqeqT03H8MRNrPDgEcay
	SFeg5kxiQOyGstsWMB9caO5BA8a4NT96/HGJlgzMcPIN8thesYIf/H+tlQgc6L4n
	wVy4I2iHyXFCpdERKUB2USqbyxczhJCiD+22WHLjpBHv1A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjxqja2ex-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Wed, 09 Sep 2026 11:45:26 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e5fc4c7e9so590960485a.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 09 Sep 2026 04:45:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788954325; x=1789559125; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xZd03ZLm04N2hieg4Jz7IpXL9lB9dSQLJ9uFkAaXkhQ=;
        b=i8c4ONAqNt9xcGUmrPw6MRtEPefogLL5ki1fQXklmjaVZa6I+rM+IUXGjulnhGRzmN
         z352dWswf/zIB9YK243UKSj/CG6Xwf0WFcmE2MkMmELeFpfZILTJw/FPKul6SChsRRAX
         Ij6G2mXipUjvPObSzx8AH1flpmpyjBEK4B8pRdyGZOs2k77j8+Xv/rAfv38JkfwThYSC
         /MpPvHMVFiZ3D6lSq84/YHVXD2Ftj8bMfV31z91OuwH5AeehtwxDHHBtGVQ2ScfwWiuu
         VenlmIPK9iBDk+ywp0Eki6+AicNADu6txNoqASobxiFj9dZh43jeqLpqG7hpqsVfk4bg
         EKYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788954325; x=1789559125;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xZd03ZLm04N2hieg4Jz7IpXL9lB9dSQLJ9uFkAaXkhQ=;
        b=iJMrGSbdPoCJ1cQxy5omaU6L+GlwoG0aPZBsM5ojdq2E+UoPsYwac39p2uGKTk+t34
         5GOR7doZwfv08qJ0PQ+WnQntdDzrXcy9sXy52iLbDvBDPa3TV+kRS3p8pf0Vy5ChoN1V
         v43RNtkv3dD+sIwEPP20PnedX/5LboFhZk8LSWvMeYNigkt9zQhNHTWsdOXCEF5hYzcR
         PBjelOs+aNNp/EMz60nI6FnD8xxPrvDfYVpA6AUhOAhvLM+RhE5OLKhAlJ80HR+ytpkC
         IXoYZjwQlkdXYRFCGI5I06ro8NGa8b2C6FuKZpDexhOfjS/Vnybk2lsEIvG+PrOxgsBf
         aRuA==
X-Forwarded-Encrypted: i=1; AKwUvBxnf1j6nyUp4aSeOYGdn6eedQ9uBKrntBYJba/zQCdRQiOwSlOhD9QCJiK7+C05+VJB9gIPi6q1njZeGQP93pJEcQ==@vger.kernel.org
X-Gm-Message-State: AFuF++nP4+Zl4MsSfIy5gAFK+tZXwmNTVXKmizbV3HQATOAkxbRhsTqy
	XYHNd6vllGSYU2Rdcd1WNNcM/nmIlw9H3nBlVFDGJhWnos4Lbhn6gkElyuQz1aQuDiu9Z1sJezr
	kIN9Jp+2cyHiH/xZ7Y/PNxxG+fL7Ew53HsvaVsDyy5+8dtXjGII44IcvSRgxsHLuTujE9ozks9g
	==
X-Gm-Gg: AYBFou2U6ox9v7ZwcxVB62STXjy8xhFAckXmV0q5XKzMjVMvPkTNC4YbIdbTYEF7u/r
	bf1wWJW8U8QvGIdpsu72yyBbAdqNyTfhl+nk8jJ4+Saz48bWCSZeVRknWo/QIBA2SrJZvONAMfl
	TnytMVfdRo4EXS3O7Hn4nPQmuIvuY8Jk1GGocxguNJu59cDa6S18v15b4Nkza7+Y7AqYnLL0qQe
	pxJ6iQGPGyaIW6bLMRfqlsozddD5whU4B+RFPGU6/C+pmD95CvHN3Uw2CXrCQGI7nnq8khflG7z
	buAgkGMypJT2zttpANrMCuOCKHsJ0EhcUTu5Mq+c5lHUAhrIgE7iy3pw1J2HmHv7bqOF4i/cwmh
	xEK3OjovjgWs=
X-Received: by 2002:a05:620a:1493:b0:937:1538:6b93 with SMTP id af79cd13be357-9398053a24amr2721124385a.40.1788954324809;
        Wed, 09 Sep 2026 04:45:24 -0700 (PDT)
X-Received: by 2002:a05:620a:1493:b0:937:1538:6b93 with SMTP id af79cd13be357-9398053a24amr2721115185a.40.1788954324141;
        Wed, 09 Sep 2026 04:45:24 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.7.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d00a5b19dsm412127415e9.2.2026.09.09.04.45.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 04:45:23 -0700 (PDT)
Date: Wed, 9 Sep 2026 14:45:21 +0300
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
Subject: Re: [PATCH 3/4] clk: qcom: convert drivers over to use
 subsys_platform_driver()
Message-ID: <yj2cq2n5rexjq6p6xjlxucqk6bolianwg36qf7lfe6zcpd46mo@ue2ulk5scwu4>
References: <20260908-subsys_initcall-v1-0-cbccf4cd4288@redhat.com>
 <20260908-subsys_initcall-v1-3-cbccf4cd4288@redhat.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260908-subsys_initcall-v1-3-cbccf4cd4288@redhat.com>
X-Proofpoint-ORIG-GUID: qCT8codYZcdfuW0h0X1-_MC1cIIGqcZQ
X-Proofpoint-GUID: qCT8codYZcdfuW0h0X1-_MC1cIIGqcZQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDEzMSBTYWx0ZWRfX5BRniChQKgyr
 5nx2ggVkafVmHkFWOT3bOBmucwLU5+WFHumnyIY1Vo+TJgx/fe7YKMNaqnBBuf8qE6pG1dRdZOy
 sujvB594UdBNwtZsXY2eD8UDe1+zWzI7E6iKxfYsZjAMOJmUYRJzXSQElPD/a5vWbNwJyGz2jRF
 z5z1nSUdeCI9UB3W5HuO93pXTC09q2b4tmVCULCXIKFeHP/i3hw9q5FogxwbdG5b1yFc85mNoud
 XfKwQiS5qKaGVMYG6hwvcttK42QWomDMboFeQQhfSBBaxBKZ5SK+add64h4PmvN/IM2udx7JleI
 CJCQOq3tVG9WphG8crq6I0YrzRg0hPJqAI9zx2H3EUvWQzb2mQ4pgICrhrq2od9xJ/OkeLvhxGh
 i7aENxboVqHMf92PpH53mvx3WypjjwtI1ffx5qhIOUUlXKBTDgRay0YKj4aIVxYckvbPdqz943Y
 Es59t7oydR6g2qweXhQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDEzMSBTYWx0ZWRfX1EeEtBuFLfQP
 BMA5XdhDdXAOlbeT9j90bFkzARt0XOmBnTMIeI10F8XYL29kckbXMSA2Tra3c4BMqh++2eZKoPb
 G5KH9hhoD78Y1KTnI/SXka2iSwO0844=
X-Authority-Analysis: v=2.4 cv=f/p4wuyM c=1 sm=1 tr=0 ts=6aa146d6 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=dePp4Gl7O00gmbwhyVsZwA==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8 a=q2Z_u8HKrAuHhouZslcA:9 a=CjuIK1q_8ugA:10
 a=tYq66TkwoL4A:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 bulkscore=0 clxscore=1015 phishscore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090131

On 26-09-08 13:47:20, Brian Masney wrote:
> Reduce boilerplate code in the drivers and convert them over to use
> subsys_platform_driver().
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> Assisted-by: Claude:claude-opus-4-8

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
