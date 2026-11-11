Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794419759;
	b=cR1CAsjkHlSi6mnvaRGKtFPBDmWK4/PAnLXcKahlT5rgdidabYF/rCBqlZmHgMGsyAAk
	 6RAaI9eddpRxvXsqvuDA89c4OlP1gsROPR040axkF16sD+PtJPuFe882z7n1/wa315U8T
	 QrSlz77EoVLYArWGzNPp5iMA7Okgrna1Hcpu4sGNDaqLe6r4VbrmFi+wl8gcjwtra4ZIB
	 8wZTgLrHYaBt/cmXER1rsnVZ4CBFP2FFs7HTtsZ3Fi0V2twb89JcLII77bYmrL4umvncG
	 9T6+PrLAd8k9XXV197jKJASX2myQWrg94+4X9f7I0RHvNqzJ9OIpvpjw1tBkMi4DzHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794419759;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=bJecVvbaLRg2W6zbI4pyRP6HL0WXZDqT9D9QDN12sBo=;
	b=KzwSzvxJJAtYHRAp3+byJH+71nY1yjkxbgKKscvkeBmO06pBWWPBU97QYDb99nSlWdUA
	 dLq/WE9YSUgDnkFpk1SSa5+NNM9zNSlrNaTtZo4MBQTBxct9wZDKZtgm+nywpta6p9sbv
	 glHeXB07krN1BLrGWPn+0KM52gMbHKirVw7T578YV/Iw60TNQUR5E9kLgB8TpJQKosOHt
	 7nd0KDM8BAt5SqCIzX+14RfkDKbmxw2OOqPVTB42QIvHKyA2y+M7tSq9xIyy26nhDC0aE
	 ttvnXFVVVrmy5l8PaeTAWpel4A1OYBNW+/MrGVwSBhD7lOJeQAy1LJsZJsnbFtPkStQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Nf80FLcf;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=P9Hb+CWM;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88942606A8A7
	for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Nov 2026 17:55:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 88942606A8A7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Nf80FLcf;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=P9Hb+CWM
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABHthZC1400062
	for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Nov 2026 17:55:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=bJecVvbaLRg2W6zbI4pyRP6H
	L0WXZDqT9D9QDN12sBo=; b=Nf80FLcf101GVkP6snltycki0xll/7xnV/48Ns50
	Pn6JfTrg5JJI2qyOCN5xgr6MgSFczD7Y78XlCL3jIea8P1Xhh32LyLJe3wInvZ5W
	IoBF9gMqaKu6WfXFiG0hsKvYk1HUu/4ABEG56i7QAtoSu5pkiarIMP3/9HEzhVjZ
	iE7yEX5Ahv6Fk2ha8iMdMXVZbLQ9f3/2riTMHkiphllQzfTEqiLN3xU3cmRPjuLm
	XHa8GcBgecjsP6Ugl9pRzAoAHB/weWDvkGNcufrEguH6EAIAfiguFFGFKYHH3WG6
	QoYEs/L4UjwcROyMJeUwO4A4Dld+tDUrhgK87F8iYCYShg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hv9b34sve-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Nov 2026 17:55:58 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f568dee56so520902585a.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Nov 2026 09:55:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794419757; x=1795024557; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bJecVvbaLRg2W6zbI4pyRP6HL0WXZDqT9D9QDN12sBo=;
        b=P9Hb+CWMVDhKK7pOlP2nHUQjXJEjxbwn8TnzzgBdC5ja2GMgzxBBu1XI9z2GGtpsoi
         dmV/EXZOh6sI9L3o1onJgVF30VXQISBh57YekSQa6DF6Z77YAD0gpRusxXXJp2xt+NOd
         keId8l45sdS2FehE9PcM82tMnPAe/P3nQAJ9XrTyJmzl0vflR08+xE6MLk1Patl+HyHN
         m1cQFzWZoEgNR6Yz5U93OUur+qTCoAZGNtWjX5yL8WklzeAOS3/+JOSgA+Us2h0Xi8tF
         9WSm4UkSkyZUykcaxmpDUDaUOFvp97RhEaAqSfjJZHuIO8NC1e3CL+w72zKx0EVjNrDt
         bSFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794419757; x=1795024557;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bJecVvbaLRg2W6zbI4pyRP6HL0WXZDqT9D9QDN12sBo=;
        b=1LGeEHm/Jacgbu6d/+eykcDBBooWO+Hr/k0HWImmJeyiRfE8sIZL/u9TCfazOeTbjX
         7MuoHBgO8MTybH9ok6Xk1Yn6Xo7hgAUbPnCa5bJKWdgPTybHbrDtZIFHj+L/JF7PrYZj
         m75FgOHpUK1cI0E0iFT/o+OZLYDMVnxEIfmFz3upuTcBoz8wxAjw5ssBJE95n+eSoVUy
         2F7nbvp1IWHtYNrrbZQG8JkrMVtCkcd/NSDvB4T/Q5Pi4QC7fZYm+qPX4lCL8c3ufWo+
         WfRuoWHOjAlYHrAZuNqiM3ICylq4EfQjscuLuczip7QgQJyGFe/IuC9A8J3LcX5ovHfN
         eQhQ==
X-Forwarded-Encrypted: i=1; AL+hErFd7f6JpPYR9quUHGF1Rop4SW24u/WFQmSgrK54hZh42ZZefiq3wb2bnmgJebMSd/EKj/3rsxJumaNgVA4Q4umzww==@vger.kernel.org
X-Gm-Message-State: APuU4Z81BQnsQKWlk11i0wvdZZmvrT9qxgoxdMAfIJaCihvFvRrCvvds
	/G+UG6xjDjKLW+Bh5sVTIoJkhNdXUA7t94XgVjBbvecqZXeLDTHAQyIX0vM/SJpDZGtTPTQyrpe
	CBtKNSvbCOIGob/Bib+4X20pgssS5moyIk5rgWiWbw66Z2ruSlst7nsDKa9XZgE/NTWdSrZcGQg
	==
X-Gm-Gg: AYBFou2+cEQ2br/XE+9DKWCQAWHVD8drShHKbKO+3SdIe/9vQNqNqIfDVuxsWQPCa39
	iuv00RDmBVzqXMRpGKVTUkhnDqZsGxEJNMjL2c2Bf+mwerQn+FlLdEISIVwk46JLaFrdNra30w/
	uW4e0FzCohhoYani2NWgXT8M2iYRofJA4H3Kofm5wGMb446s/yjnFHYPlWYaBjNd7pOiOyGVkPr
	8lTNWDSqSHddXmPP15ARei75INOhVf2JFrsnLSM5htabd3S2oMX+9EmxUhteiTB/bUj0LYC2vg/
	lKLOYMwB2aum0RL0fCvmZXLculZ5/uhFm0NumKbdXFfdiBYgfejiQdsvCseGrQqzYCIK5uufs+h
	4hFkjQ+gCidV1MXgxxyOx8KY8ObEB02eWqcfkOEEaCuz8Z2xK+MuHYamkfMH8tcAzPdeL83N5Tg
	PP56DXCMCV03/N9J06ha+k4Zhr+CtOqL7NfRUygjxa/3jEIPY62g6orcsg+Nzk3g==
X-Received: by 2002:a05:620a:2544:b0:93f:3829:8492 with SMTP id af79cd13be357-947b006ea1cmr485345285a.78.1794419757388;
        Wed, 11 Nov 2026 09:55:57 -0800 (PST)
X-Received: by 2002:a05:620a:2544:b0:93f:3829:8492 with SMTP id af79cd13be357-947b006ea1cmr485336585a.78.1794419756700;
        Wed, 11 Nov 2026 09:55:56 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae177150c8sm4479411fa.40.2026.11.11.09.55.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 09:55:54 -0800 (PST)
Date: Wed, 11 Nov 2026 19:55:52 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Maxime Ripard <mripard@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Joel Selvaraj <jo@jsfamily.in>,
        Jagan Teki <jagan@amarulasolutions.com>, Ondrej Jirman <megi@xff.cz>,
        Javier Martinez Canillas <javierm@redhat.com>,
        Michael Trimarchi <michael@amarulasolutions.com>,
        Michael Tretter <m.tretter@pengutronix.de>,
        Cristian Cozzolino <cristian_ci@protonmail.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Ryan Brue <ryanbrue.dev@gmail.com>,
        Nickolay Goppen <setotau@mainlining.org>,
        Robert Chiras <robert.chiras@nxp.com>,
        Alexander Koskovich <akoskovich@pm.me>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Chris Morgan <macromorgan@hotmail.com>,
        Barnabas Czeman <barnabas.czeman@mainlining.org>,
        Heiko Stuebner <heiko@sntech.de>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Arpit Saini <arpit.saini@oss.qualcomm.com>,
        Michael Walle <mwalle@kernel.org>,
        Ritesh Kumar <quic_riteshk@quicinc.com>,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Svyatoslav Ryhel <clamor95@gmail.com>,
        Danila Tikhonov <danila@mainlining.org>,
        Jens Reidel <adrian@travitia.xyz>,
        Michael Srba <Michael.Srba@seznam.cz>,
        Shawn Guo <shawn.guo@linaro.org>,
        Alexandre Mergnat <amergnat@baylibre.com>,
        Alexander Baransky <sanyapilot496@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Romain TISSERAND <romain.tisserand@gmail.com>
Subject: Re: [PATCH] dt-bindings: display: panel: Make DSI panels port
 optional
Message-ID: <dki5db5xizrwwijmjbnbx7irg6if24l7punctr2wx35j4toi5c@4rip7azwzt2k>
References: <20261111110338.81717-2-krzysztof.kozlowski@oss.qualcomm.com>
 <avRM_GhtR8vMdTO4@houat>
 <c8dea6ad-ce41-44d2-96ab-233b0a4b1340@oss.qualcomm.com>
 <43373a9e-9ff3-4641-b961-b63f4de21cb9@oss.qualcomm.com>
 <oubzclitudtqiv64wvg5lvxvbhuffxmc5bgbsdz4ou24pfhbb4@decarhvjzl2a>
 <0f2c0eae-ed05-41a2-8688-e4b6fe1b7ff3@oss.qualcomm.com>
 <avRy_D6MTK5u01_9@houat>
 <8a557bae-42ae-42bd-a149-cf854b7af9d5@oss.qualcomm.com>
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8a557bae-42ae-42bd-a149-cf854b7af9d5@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=GKGdgeNK c=1 sm=1 tr=0 ts=6af4ac2e cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=b1Xqci6IJw76lUnxh3wA:9
 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA3MSBTYWx0ZWRfX3hPeWIJZt4Fc
 xYc6Qg7SSeXeQq1BZ5CYZRxUD3b5gKDZfs1OS56PZiSDBggLJoSkMvepXt8QT+Y0IiwI7O28MuA
 o1lvPcuRBRE2dxPezdUTTimu7hcez2Qo9uRxV+sET8eJ492ttSiv4SFq3aMCgYBHqwiR+rHY9qs
 PcYwtxFrZMwRqvBvlpcNPjd/9/TaK0NIDoLcUJ/Y4zcPt411GsqUf7hJxeEY96G8QvuoTisxfYI
 eyHI+K4HK6vTRRKf/068NKxtUSpU5vSXCHKsahfqk8MS+D1oAdyjvd2UysXbgO34wA1n4i0kGgH
 NwWdV/05YEbS1hs3J1anqJyPKOs2fNmaxEZsDtEmJ8tmXng3/71BzXSi3gVtI0YwMOpT9uW9+0O
 lW/KDeTAyhYTWHhwSLcEZvIStZwc8jT9BlkNBWQ+QBf1uSqUDJX+PlHTReNuDpQOioWQaASlNUA
 0jY9JJXiSvpZpGBG/CQ==
X-Proofpoint-GUID: u3BIjnlCD2BHvXLOnP9Ue_A5MktJhrC7
X-Proofpoint-ORIG-GUID: u3BIjnlCD2BHvXLOnP9Ue_A5MktJhrC7
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA3MSBTYWx0ZWRfX3XxHUx2J5iXq
 nu71hhBMXvw8061vrcVv8aq7zCQBxtQETuYKcsurB1FVuaiH5aMK90Ucj6Iwv238PDTri5sasVu
 nvoGz3VuwlL8vpug9hbRDKKEvbGo5VM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_04,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501 phishscore=0
 spamscore=0 bulkscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110071

On Wed, Nov 11, 2026 at 02:54:54PM +0100, Krzysztof Kozlowski wrote:
> On 11/11/2026 14:52, Maxime Ripard wrote:
> > On Wed, Nov 11, 2026 at 01:44:23PM +0100, Krzysztof Kozlowski wrote:
> >> On 11/11/2026 13:37, Dmitry Baryshkov wrote:
> >>> On Wed, Nov 11, 2026 at 01:31:39PM +0100, Krzysztof Kozlowski wrote:
> >>>> On 11/11/2026 13:30, Krzysztof Kozlowski wrote:
> >>>>> On 11/11/2026 12:13, Maxime Ripard wrote:
> >>>>>> On Wed, Nov 11, 2026 at 12:03:39PM +0100, Krzysztof Kozlowski wrote:
> >>>>>>> DSI panels can be placed under DSI bus directly and many Linux DRM
> >>>>>>> drivers will work fine with it: mipi_dsi_host_register() adds device for
> >>>>>>> such panel and DRM driver does not use OF graph to configure lanes.
> >>>>>>
> >>>>>> That's not true. We do use the endpoints to configure the lanes through
> >>>>>> the data-lanes property. See drm_of_get_data_lanes*
> >>>>>
> >>>>> Some drivers use endpoints, some not. As discussed on other thread,
> >>>>> there are more than which do not.
> >>>>
> >>>> "there are more than one which do not."
> >>>
> >>> Which means that those should be fixed. We have legacy cases where the
> >>> drivers assumed that, but we should not target legacy.
> >>
> >> These legacy drivers work fine for 10 or 15 years, like Exynos.
> >>
> >> You can improve them, for sure, but if no one does that then requiring a
> >> graph is a mistake there, from the panel point of view.
> > 
> > At the very least the commit log needs some work then, because the
> > situation you describe in it is simply wrong, and quite different to the
> > situation you then described.
> 
> 
> Commit msg said:
> "many Linux DRM drivers will work fine with it"
> 
> So many->some? Is this the only problem? What else is not described in
> commit msg?

The commit message points out that a minority of drivers use and require
the port, while majority of the drivers don't. I think up to now only
the Exynos and sunXi were mentioned. From my point of view, it would be
better to change corresponding DSI host bindings to allow port bindings
and then define the OF graph connecting DSI host to DSI panel (which
might be done gradually, etc.) even if the OF graph is not used nowadays
by those drivers instead of providing a false signal that it's okay to
have DSI links without OF graph connection. It's not future-proof and
not okay, especially for the new designs.

-- 
With best wishes
Dmitry
