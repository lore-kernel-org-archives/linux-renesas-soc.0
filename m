Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 061014AF164
	for <linux-renesas-soc@vger.kernel.org>; Thu,  3 Sep 2026 13:35:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788442554; cv=none; b=e+vzrwWoTjCCdL8CzZIORWW6ssxQOPQUdLeLZ2AT2jaJtRtzRu2O4hTzC7XYBDyEr9qNJeny8X9VwBB4nCg7JosW8cdWyjfMjyFrZxWVFSY0mnMxjDMn/1Cazy44+narEFI1VJT7EDkzYl5iF0bhREvnVqG5y2r1xdkNYRMITcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788442554; c=relaxed/simple;
	bh=EDyoKHuGKwkBHb1TRmNlIgq/E1jTMw2X0zz7N7Lh4Uw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dHZnjlj8+7pQUBMgmbVBaWR199KDEcW9X4w+EoRqjljT8ZKqDiuZ4eXDExQrYIMo3XZVE5hdnwCJCWC8+WAYgpqG7yCXPIOOPd1+R67s/8Cld7qw7QzjsHrGCzllpnGWc3q0PZlH+PFDypKzw/ZQ1rDD01M1anERWSl2dLKdB6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BSvx4drq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SzLS0rS1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BSvx4drq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SzLS0rS1"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683DAd1q4158179
	for <linux-renesas-soc@vger.kernel.org>; Thu, 3 Sep 2026 13:35:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=/4DLlFsjYWfVj0wHcCsxEd1j
	3B+ydgKXEWS4cecbkdI=; b=BSvx4drqyq3Bq3EZ4Z+8Xo59dZXrCvjUqjwD9IMj
	GKSLHML9uKqAzyu8wp4/dQFI2bhcasK3BoCgGwGfQoUVyM0ov5m7pyRU7KURW1E7
	VSt8rohEmBBAOHNU/qSrgy7uB/SLE7dT6uxC2Bhvn8eEKgRFRgyhrdIZxooUgSfh
	OUicmKFSVi8lCCg39LYLpxPKVgQlRD3h9Ds/oHp3Yy8kvXawx+FdduzJ0EfQa1e5
	YDCotmLTrW2XSx10dsoLsJIpPJG2/WaSUx8+Ts7u+EUtlzaZE481Qy6rECF8keUP
	PRm6lhxggtoPcV/V4ZinCINUdJNnwZ4DskjLy99L7BuM/w==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf5pds4c0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Thu, 03 Sep 2026 13:35:21 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-939694871aaso285518385a.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 03 Sep 2026 06:35:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788442520; x=1789047320; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/4DLlFsjYWfVj0wHcCsxEd1j3B+ydgKXEWS4cecbkdI=;
        b=SzLS0rS19eempocLc2bm+9yQ9bRaVDvXl+PIzq/56uSjUFrHCxygEZQrYTUPBYGfjZ
         nDx3ErwqIQakv6CzfEaNhSLuF6pjRiw7xoNhLbOcKPL+BU3GlGuOd4BoaGU8Ft8AJohy
         +weNmED41+hphTFDTi2hz8RQhhK2ML95jUYsDDZZFvVNNISHAb3mzwCf/DXOYoR9pNTi
         R35NpdNR3P/BUOUnwvDhf6evn4u3UwlSsV7X4/rm+z4kOxKVn10aNkcXTNY92K9xeBcI
         ttqGmJAdQe/qATeguJxOCg/MQQ9j8FbSd8/eAgXODnrfXzY0Gehjvza8XPOvVpXEJWxx
         YnaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788442520; x=1789047320;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/4DLlFsjYWfVj0wHcCsxEd1j3B+ydgKXEWS4cecbkdI=;
        b=LJa6ztMKt2/zl5q1ldGDAFxBsY5jWtvzTs4ZOIH3qg51eYuLgO/c8auy7zyEtAqpoH
         6R6HBYoDAMgk6wjYlNZDNLkjgkw03HyUCslD38q8N1VOmrCVvKteXe2jHwBN2nlASz7f
         0ukZ37lZdZfil8VUAp7hvNr3eXqsIoq8lG4UiJpP4k+/L2u1g9SUYomrFkVHuqhC6NJ6
         4so7OQfUZ3jNVXnh/uoFXP44HlGy1vVRCpt58SLl3brRojuh3gMxUEHo+rZrnl+l5Pnz
         4nwX5joPb+mhkhlijwUQz6l8oKXiqDPFjq4YLAqBD0jKNg9sPdFh/D1WKbHT5V8RQkRW
         U5PA==
X-Forwarded-Encrypted: i=1; AKwUvByVycv1cBwHT/47MolM0HKu9v2R8+g0Jk2IPSjzbXO9XMmGx9d6mmNmPO5sKxKmJh/F/ZpZPQ131zP0zPNzUcA/iQ==@vger.kernel.org
X-Gm-Message-State: AFuF++nUww0E0seAWYLyU38L31S8LKvxwfoGZ379EmuSbDgG1dDX88dn
	VrNpRhLbkIHnjrJCsF6PSlyRlhVXj3OyAxrl9GouMG8FOvz8ahcv73fBKiLKFHeLlJDH4Ki6Jbz
	T59O6gDOMMMucWUJi8X++yZo4Hc9+4Y18J1pVoP/w/j1JD0gMljXQA6//rCNOFE2wSH2vtYJxdg
	==
X-Gm-Gg: AYBFou1voxjax6UjmccQO0KRIDrhZ1kaN1n+5zUPR1pkOF29plX4Md4n4Yp5Hf5/jIv
	La1mJGvURtVVzKZmS8qk2HRdruYl4Zl6USspjj4oEG82EzVaemCHOZkfyGrOtTiNr/vV+F2CyBI
	03lZMBvAAQYOjvNZKgrQ6ul1Fy/myQXdcV2YQ+RS3aooqJJPX/LhyN3hrLVxZrevdN0cqyGqFM9
	rfJDQmnmAWc1ESDxNoPoe8sQ+n5rfjJO5oYAYtfltzvE1coJRWK79bKefEns+0rUM8U5XRl5ANj
	PU0z2tHNdsmqMA32gO3A0IGqLs3Y0P5r5r3Wpaehfnhd5XyH7lO/lCrEjOs11nY4JIMzAK3rJw7
	NmuojcP2TAXwi
X-Received: by 2002:a05:620a:4620:b0:939:46d2:9673 with SMTP id af79cd13be357-93960ccf23dmr1194050785a.1.1788442520348;
        Thu, 03 Sep 2026 06:35:20 -0700 (PDT)
X-Received: by 2002:a05:620a:4620:b0:939:46d2:9673 with SMTP id af79cd13be357-93960ccf23dmr1194044185a.1.1788442519793;
        Thu, 03 Sep 2026 06:35:19 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce591f846sm57380275e9.1.2026.09.03.06.35.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 06:35:18 -0700 (PDT)
Date: Thu, 3 Sep 2026 16:35:17 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>, Ulf Hansson <ulfh@kernel.org>,
        linux-renesas-soc@vger.kernel.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH] pmdomain: renesas: rcar: Make area arrays const
Message-ID: <zldqedy4deednmec22sp4thap3fzyfyl5ldfgut72wfemoyhrj@lh2g7l5yvj6b>
References: <fbe8b4a4d90f0b555285cfb4ed18b6a2afc38b74.1788436280.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fbe8b4a4d90f0b555285cfb4ed18b6a2afc38b74.1788436280.git.geert+renesas@glider.be>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDExOCBTYWx0ZWRfXzTNgHEDj1uAe
 jTvAd3KL0gokXDTyAOCggaM073ac1T2/W3uZuTUIiGcHo0A0OJ+m4yz7dIdCv5Z9xwqJyn2OoMZ
 bKurVrbud3zQa/mJi3CMAc9yav2MpVI=
X-Proofpoint-ORIG-GUID: HoU8rOd-bsv828jplVQrdXBZSkqBLFsX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDExOCBTYWx0ZWRfX9/2Ub011vRE3
 YKLcpaQOHhwjFNVGrR68zXhu11OtdtYC3vc3bcVM4jDJFqBff+M6T7JujxrMi5K7mOXwKYx/3SS
 WAzlIGJHNtDKIUIZRwtMQ3d7ygMATQ63pjF8sCNwoPpVOasGUTMcw645uYOlKXiBAevXhiyOZN2
 gbGGvrkwyocDlqn3Y79/VBD7ZfssEEcQ1sOv428Um0EGCUcggXDwD/K6bYZBaxKYTXLUkVxT5Q3
 LGjBlyTOpI/SERLRt0IKplU2N2giz81NyIp2qbjJrljzZfLws1SZpkW1K9M+Lktc8LH3QtVIVG1
 5M70FtjNvPkFnzX+OyXR5c/z8atHVH8THwqDjZnx25NY2OPoOEIvnjT0K1kz5QyC5RPAJvGXQiZ
 JDoe2e/ObX3R4uRqJuJIx3SAM92uQOnxxTp0qF1ctnTgirILMrUW52sc85kFJRZOtlBh5Mhzvar
 mwFOIDudBtsCZVqbaiQ==
X-Authority-Analysis: v=2.4 cv=RsL16imK c=1 sm=1 tr=0 ts=6a997799 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=q7XEBjOi5DRkXzmV0jSBjQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=Ue1xspChCpTziZYzp1sA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: HoU8rOd-bsv828jplVQrdXBZSkqBLFsX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_04,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 lowpriorityscore=0 adultscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030118

On 26-09-03 13:56:56, Geert Uytterhoeven wrote:
> Arrays of rcar_sysc_area and rcar_gen4_sysc_area items can be const,
> unless they are modified by quirk handling.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
