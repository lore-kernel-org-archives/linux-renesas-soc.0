Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B967A3DA7E0
	for <linux-renesas-soc@vger.kernel.org>; Mon, 31 Aug 2026 08:36:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788165402; cv=none; b=WFu9tQgNzLE0CAfqGOQAxr49qrh3gwjSfqJz/QubTYA3q62B331Xi37RzvRmjRp02kYprCS+RL5qRBi03UbzUkCVZtIbiOlNsruVG0AJQA5un8u34wpWUbeFm8gaesvmoNHd+6rzG2Q1ByK0ccQlgUJm8DRsarwVLS/Z0DLnZN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788165402; c=relaxed/simple;
	bh=X1PkckIN8HFBzuUJHXpj0gyUsnyjgXDoDkesNRi0/Rw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mtxrGv3lzIvEzXLExrzR/sHka5pVFHTxrkEv05Z/Ooc580T70dJnMP1H1Yv5U0i+y3GWzZiAaESDA1as8xbpK6CiX8Gsudg7nDhagGDZNJ6lG5F9Q6RCqNiTGOo6QE1rWtQhavL25XAor0a7x26n2tZbK9c1bKehgZdgdlKF1NA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gZGcdVqd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cGQjy3I2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gZGcdVqd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cGQjy3I2"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67V7xIlr2460282
	for <linux-renesas-soc@vger.kernel.org>; Mon, 31 Aug 2026 08:36:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=5fbuWbLjGe/VWQ+xdqB2iUkT
	CTTMr+XlvxmuKcx6U5M=; b=gZGcdVqdYCsO0VsFhHqCd0VhhrMbdCkRyY8TWLBh
	++VTxnmO3iIyUqjlP+B5/cerum7HIrjv9zP2HnfE5RQcsL8+LrCYHssf0erBBe/6
	yPg59MOQU59CgT4vl0EEiovk/n/fFF+gdJxID8bQsejPRjdSjINxlmAmJxtHLPWW
	/8P4HVTAJ8B63M9yalng1HACNhguQUK0ztg+wLegIVhldcEeqIBawQHPr0PqWDr8
	vdFbq+S7hV0hoBsxlV2fo+/JOCHOjDSKcBJmBZRR90khIBOrxrlFka4Y7Uojcwk1
	KIENC3EhKg/VrR+iw7xbVtkbED6OI87al+tzt8Vp4zgJTQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gd556ra5s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Mon, 31 Aug 2026 08:36:31 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e5e38fbc5so453579685a.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 31 Aug 2026 01:36:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788165390; x=1788770190; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5fbuWbLjGe/VWQ+xdqB2iUkTCTTMr+XlvxmuKcx6U5M=;
        b=cGQjy3I29jVjxsiilLkPcd4Rf4y3yq52fNxmHfnQxHgCfa6RIFJNxa7R5yiPAONTEM
         JnsPlolUdsP2ks1MqgKzKY5qUidc6Cwuh1dITv5NbohMnbtQG2h7sxxusZ1VIrJIga7E
         7G1yM5AyQuCr7FyWXsrfBLE4QECt5o3h1gHpNUlKWE32siiKRn9m4hb++clCUtIsUyxF
         ohKIbBT987LvIzmbMVSq+dYNfXIiR0PDvExzq0Nc5PvYMX+gAqbGRUAG69BN36ghfA5F
         DCO5OIQaBIQb8p7jzwUyk0SNbiegZpQsEgFXWLkf96z6RGczT/PRVOz7IgWFjl6Lf9bN
         WZUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788165390; x=1788770190;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5fbuWbLjGe/VWQ+xdqB2iUkTCTTMr+XlvxmuKcx6U5M=;
        b=SRw1/Bg9Kn73UJLsnOUghmZnPUF5T8UfPynxLpR5LSyjniaHt0SoFYle//+fU9yqz6
         5t30mJTybJAxDmTAQKEU/0mBTJu/dRiyYFrphpCSSK5SE9XYEz9+2F6aLnfouGtw4sUn
         oSYN+lA5FpyZlgVFLH75YZk0fB5Lbu+9X8LLTHkF+U0gxnW2gNJyUh3ji9CIMq1sug5O
         99oMVSPdXzhcrD6OhXeic9MvBOlrBQMZkDqoorxQ+HPR7hqNuuiOdGhb9woqOv9R0/91
         qzDK1HOo4mrBN4RBAvn56jzCxGJI9faLE+tuxffudaNx7r7V3zI2J+wbQLI4i+IU1X1T
         uqeA==
X-Forwarded-Encrypted: i=1; AHgh+RpYYTgrktgPzzJ6cgDX94jYfCh4FonWh+EAoqUKttfVFpn6YgSPQHeoccxzTcc+gIiWzxfFrGYilNnKkWsW4rERHg==@vger.kernel.org
X-Gm-Message-State: AFuF++kEqr0v0qIg5BzIvo22NNRFWwFbP2EZkOE+0Lz/5HcCtb/FIYiY
	i0kP8k5uGQ2KBKTA6Z3oGAah3ernVtb5qwifPy7G/xPa4J0qazKon01DcW923maygxQHB2cttT7
	znoqxkAzNGzrw0XSTW8ZZG0rX4GRM5HGx3cO+FnYc/wOMbew0Xs/9kFM15YiH2KG6CfOcAiapMg
	==
X-Gm-Gg: AR+sD11vID3YicDxcttVcDC5FgYg72Vew2E4s8/rIvLyiAXdKRuQAfqFcbOFaORBcYv
	o/L8vXzA7R8IHJCQrjB/U7LIV7uW0938Dc+vyjzIuL5ZP2Lx8C/DJkD8OALzyVNNXYnhznOI23E
	VxkzSFj+ZzgkI5EiCXDIJJJEaMuFongVy7wB98WyxBtjMQ0wZgiUsa4JF+qyjZB5FSZKj7N87qH
	MrAr5VnlmwyxFjNWCns9OKMUafF6P0phgguR7aV+EnJ+YJPzQ0hsTjuZE94YeufOGmht54CBs4x
	eLbLCgm7HbRBRIwhi47EY+GQGXh8ZbNtF6d2/Kb/+HxsVlx+bHUzv2H9ZUAE8eX1+77q9ek5+Jw
	qjZMKFSyX5xqGsw==
X-Received: by 2002:a05:620a:8385:b0:939:197f:345e with SMTP id af79cd13be357-939197f3754mr2690955985a.22.1788165389850;
        Mon, 31 Aug 2026 01:36:29 -0700 (PDT)
X-Received: by 2002:a05:620a:8385:b0:939:197f:345e with SMTP id af79cd13be357-939197f3754mr2690951585a.22.1788165389248;
        Mon, 31 Aug 2026 01:36:29 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.13])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4843adf1377sm6448270f8f.18.2026.08.31.01.36.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 01:36:28 -0700 (PDT)
Date: Mon, 31 Aug 2026 11:36:26 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, KancyJoe <kancy2333@outlook.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v6] arm64: dts: qcom: sm8650-ayaneo-pocket-s2: add
 display nodes
Message-ID: <xtjpv3a5cy6nvr7gw5ln4vuwdsctz5k4f7lcmfetpre5lwia27@omde323ra5mf>
References: <20260831-topic-sm8650-ayaneo-pocket-s2-display-dt-v6-1-1e3b67711eac@linaro.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260831-topic-sm8650-ayaneo-pocket-s2-display-dt-v6-1-1e3b67711eac@linaro.org>
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDA3MyBTYWx0ZWRfX1ctJY0UY3IYL
 oQv/KyfpIMzxgBIqKJwNlHWynp4Gwu9tz2kEUrA1LhDIWx6Z/pGZQvnBg/SpEdFzMjkjcGoNt1A
 NONuh2piMvv2sF9fYPvJRzRfZLpreWk=
X-Authority-Analysis: v=2.4 cv=O7sJeh9W c=1 sm=1 tr=0 ts=6a953d0f cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=clBUptZa5v5FR042Ey+sjA==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=UqCG9HQmAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=Twdo5_02SbyOhDGnJGIA:9
 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: rl_Zm1inI002PYOu_pa4yvl9wQQr4sTO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDA3MyBTYWx0ZWRfX4SEjUpzHrGCY
 Awz4aXaTEDuc+Qq18yfiF/hfBHNZal5nb82Ai2d3UDuHRdWQvo/pS2SZ5NGMccZoQOV/cv8ohbM
 HX3VsHrDYG2rJRiD3d9GW8DS0iQO8xjmJfu3cbxvGRVahAJ+oOyKDB0tsKipCERVTNxU0D3b8zk
 Rs+ctbc/iensW6ewM6YBpRyCk7aMauTfkfQEfnJ8f1xpVzCdOMymmSPGqWVdLa+/gVVF5P8m/vX
 Hca7IvO40h00HTe3OYa44V+50abyfHQD2eCfbhgCMC8sDnQRu4oXV0cARHVeQAQ8+2n9Ye+E/hK
 ycaEprVDZuQ7HsYQMPlaks6zbwZf5zDlBhJeZM5rA9FG7n1cPF45tNuLSHKfbjQygCcCacwv2nd
 cFKTk2qQB/8f2WfZ5KFBr8b40FAswyXYnsXJeZm46rtEp8ryJadxavIb7YjGrq3gjV4DRd0g/6o
 By7xzOcRUrznggUolrg==
X-Proofpoint-GUID: rl_Zm1inI002PYOu_pa4yvl9wQQr4sTO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_03,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 malwarescore=0 adultscore=0 suspectscore=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310073

On 26-08-31 10:20:52, Neil Armstrong wrote:
> From: KancyJoe <kancy2333@outlook.com>
> 
> Add nodes for the dual DSI panel, the SGM3804 regulator, the
> SY7758 backlight controller, the touch controller, and enable
> the GPU to enable full display support.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: KancyJoe <kancy2333@outlook.com>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
