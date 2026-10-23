Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792764407;
	b=GoVrd8CxwiEAFAjb2cz7tD4ewKT78QbuTt2NMYpGfyfMAcGdp9sVoEQoeOebMiyQUg2B
	 757PPa/gE4uLxfOy2fnJxqimKq8Pml1gSxVK4q2WF8kSKM+C68uLAepi3yMEoJvprMwXG
	 CqpCxdZQoi5I9HmcLUP5n0yFV+gFDWH3LogeK2Fz+43BYjuCRoOOQIF6FgcD8N+Hm3Ok2
	 08NGJuE7Geb5Vf7987jckYU229W4QUF5lff3vlSgThm9RxX1A+MTJo6pM6pD7t1rR0te8
	 zo7LdCO/KjVOQ4iq/eadSJDAsOHQ4B6npY1NKa4iGIDrtaXicJh55aKp2buBI39smjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792764407;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=CIGT6T5jpQ5FmUlyBZ4+jWajUL9eR2jOzBgtYvKHzIU=;
	b=AEsjqsfUFijvct8saOfDaFgVKwSfyNlny+H4eguvD2xSN3VEgwrIV9iONGO4e15KsF0/
	 V0ENZfvriXhSaGb/Op8I3yZa5XP6+Kwz2FSwl/4TpXx5TnPdpQLiEk5pLCCu/qpqbbKzZ
	 5/iAYtrdSeJtPOSBnYH0e16+LktFxRBzOhfKZrEdNA8IOMCZRdDkERuaEpy8Nc1o0WD5F
	 4s5iOPBhOlxKrmldyBNej5foyZlQL8Zn4hRhipMYuEPvvsjJ/jV/Iapf2XGOsyIV0S8z0
	 6crqf9gq/hsYrbdwVDWWVME4LHFSRAW4CFO0O+HT3cuu2/SHvhTyaiTEZGGaoRECpsw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LipgI+45;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iDEXuszL;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5EB1606A31A
	for <linux-renesas-soc@vger.kernel.org>; Fri, 23 Oct 2026 14:06:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5EB1606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LipgI+45;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iDEXuszL
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NE6DXG2462566
	for <linux-renesas-soc@vger.kernel.org>; Fri, 23 Oct 2026 14:06:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=CIGT6T5jpQ5FmUlyBZ4+jWaj
	UL9eR2jOzBgtYvKHzIU=; b=LipgI+45CzIQAaLn0Iqy8z5+4xdRW4IMx5NjkckG
	DLOzCswr8mZKejBi4M3evK/BQ+VjB03INlKZFPRGoludhrQG2LqN3W6RuJFKBnXx
	vgKYUtZmDY5xb+HdjuOCWLe0YO1p+HYibIZL2ngizrgjkhh6HDjz0ObaaoRJDXeQ
	ezpqLeeNo/pSU0wKl6WgE7CjCXsfdNI2bB6dUwiY7LPX4vyU5wuB9uFmc3+8Mjx7
	tMxClPG0Uk4Joj9pwietnSZ1sTRW36qqMn+yBkPp3EjwcicLBfGcfN/BUGAK71ok
	LQz1Dh3ZS+d60lQjVGwhm3rNqRnYOuL0YqGjhpP/ALH7aQ==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqmtv1r5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Fri, 23 Oct 2026 14:06:45 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-97e8be2221eso210175241.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 23 Oct 2026 07:06:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792764405; x=1793369205; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CIGT6T5jpQ5FmUlyBZ4+jWajUL9eR2jOzBgtYvKHzIU=;
        b=iDEXuszLRryCwE0OUbdkA6M33xXqSUb88URBRnJaW5pq6Txg20OVrbYwcThbKAbq8e
         94jWC+s//2MT6I9Ty73D1bNSWrUAc3vQvxahYwOFemBxLH3XOqJc4UtI82g/y65Q40cB
         yfF50jtCN8RBq4EImncK55OlPvDwZ+Udgh6KfuPvR2Ea9gfDkSLceKTtNgcncx0VBZTK
         oKNEPz8iSWmoDK7IzK3ISKrZGmHfTO5OJ5pIcrQWstvnU81QvQQ+YiCbaM8kEf01exRM
         BGi5k7t3viHDYagQQmAoU+rS6BngG4mQZ24LZGAhuxNT2bXYAmURQAdMKuwJjvwf00oO
         57Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792764405; x=1793369205;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CIGT6T5jpQ5FmUlyBZ4+jWajUL9eR2jOzBgtYvKHzIU=;
        b=pjd70W6IgDBCUjFbc7wn0Ej6MkTAwfhxs92i0Lds77115eSBS2UfYozvcew7+M/x+2
         4tXY8dpATI8nSbl15Al3FaUQkVMQ23X3frwxxHmADEPjyEdcmLPAzsrQX+ur/fTr28J5
         MQSUSIfzZwQNjq5EQziv7nZlzk8L4pHWrF5qFXjmvgSTv9B9WCs1+P83NE/dJiWP6Vc3
         KvRdPKAvDaou/CmTWOFAfcCK3wIn1ztnGyiVGzFIeuBvjtklf8WO5qkgDYuM1sUVdR8P
         ZVpEm9bUNNqs9CvDbrJmZ0yBz1G6Hy0YynudyY8Oc8ElKDOHt513nzRx0wcR5UKRyJ+l
         Cjqw==
X-Forwarded-Encrypted: i=1; AKwUvBxPJKQIX6jl65rBSkObyM2lff/rsy+6VUh+uhWZYQcfVufRCQLMTu5mIiYW5sWt5HQ0vkS4LlJWvdjRiCAdvjnefA==@vger.kernel.org
X-Gm-Message-State: AFq9FYIt70Fg3+niH7tlPs5GMM32x0v3Bcaj5rjlVl6t+wbMNJJ7hSbb
	Q6Ud+lnwARP63wAb8JJCSc7P+yXfD/mPCp/W4vPX9xI7ekPp3r8iUMI4j27DSjhz91F9wdQXX8c
	0XCkmhfRMT0f51M+NpR1X47yJrOQkzKxtBvaFtmqvnFq5S4+KYK8fLMWYqMiS0k1GXdaLx4BBpw
	==
X-Gm-Gg: AYBFou0B5tGfMWfKZaIPwMzNN4uXdgDbDJXZ4ODgmzPK7/sZvR5/gTSDDtlgp7jbOhi
	tFfYSQWn2O98jObYbQXwNb8wRSWg19mwBxR7cwKvQqZIUpZ0H2CkCg5FI3t8GraMtFHie/pMA3t
	OVJXzwkdhGxgmvQRDWEgfRIet3khSnMImEzDbB16PLRMxSV/M3LZyGzEW9S+FJrGVlevzMGwIkB
	OK1pfKjgCP8qAFrJNVidcTHJtibq+W1rYe7DUwkiApbHWFlHcW7wVhA+rfo6s68PScitcWlD2Dj
	7AiQ6hX35V961WMX6wx9S9C9Ta5RzrgnfiB1dOF3CQbKssr3BssGi/ATvmDKb8JITMTnfctAc4x
	hHBbH/sqB5CKG5voEMh9xMtYINVGZlfuyzYvkn7ZBF6b0dyYkPFWu5OaOnaD1+wiF7/ODk2mOpZ
	oXGb2y/MdKbG81
X-Received: by 2002:a05:6102:54a8:b0:7cc:226a:f963 with SMTP id ada2fe7eead31-7ccc33f251dmr903859137.28.1792764404679;
        Fri, 23 Oct 2026 07:06:44 -0700 (PDT)
X-Received: by 2002:a05:6102:54a8:b0:7cc:226a:f963 with SMTP id ada2fe7eead31-7ccc33f251dmr903816137.28.1792764404087;
        Fri, 23 Oct 2026 07:06:44 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfb027d282sm401608e87.42.2026.10.23.07.06.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 07:06:42 -0700 (PDT)
Date: Fri, 23 Oct 2026 17:06:40 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        Thuan Nguyen <thuan.nguyen-hong@banvien.com.vn>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 3/4] drm/bridge: display-connector: Support hardcoded
 EDID for VGA connectors
Message-ID: <e37zh26agih6xocxiimewb4eulrvmuqrrb5gtrtmrix3zcsihm@3e752rnht5hu>
References: <20260705213542.28987-1-laurent.pinchart+renesas@ideasonboard.com>
 <20260705213542.28987-4-laurent.pinchart+renesas@ideasonboard.com>
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
In-Reply-To: <20260705213542.28987-4-laurent.pinchart+renesas@ideasonboard.com>
X-Authority-Analysis: v=2.4 cv=Gt3XaU1C c=1 sm=1 tr=0 ts=6adb69f5 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=P1BnusSwAAAA:8
 a=uezD57GckRT0Z6Tr3-kA:9 a=CjuIK1q_8ugA:10 a=TOPH6uDL9cOC6tEoww4z:22
 a=D0XLA9XvdZm18NrgonBM:22
X-Proofpoint-GUID: mEct8FX2zZk2x9g6VRpqM9ETdzuGg_yS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA1NSBTYWx0ZWRfX4l4k72DP5Qxp
 rUrwCv+dB491sVppPsQpoIH4aATnO5NpxF/bV5QPylWaNxUYHsrCA0ot8beChZvn1dnMo3yViBQ
 m1ngxrnbsjC/YPAOIpHMxSZCRiMizFPC4wznJAa/cgz7rY4MLreTYBdhe7VtaIZBuznkztsFcZI
 xLC1bNtlqizKPauUbQfE1m6nNE3qa9Dtodwjfm+OLRb8WqrF8kO819oOzDnRp+PZU04moUSWyxi
 BwaexJxRS24VKv5HlyzSgYtJmkRsr4HgT6igr2pzDcFaL1jvy6Hwsf4H6nbNYYUDMBK8370SGpC
 8lvnFxNOw4+bbuW8wS5l4rJQQVvTGqSxXzQmtOr1KQNkjFePRJ4CX49qImYItjQobwlxfzKZ78W
 8hSez1fx9tCRyhxSQY/Mc/ATa0mvZl+qcx0IhJxsgesQgx/DJnf0RSbnCAuAxysUZdm3ikPGHrU
 6dXKq7xMAgL6gmGczXw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA1NSBTYWx0ZWRfX/54aZ7bckPjS
 DNNnuykDve/SgVeTLonwlPHojMDeOt/DvDZP9aa7sK9IciO+KHwGbOnpbce0ekKwlhp2DAhNslB
 Hdy7wDfhAyvTvcPgVj9ZopV9xrnZ9I4=
X-Proofpoint-ORIG-GUID: mEct8FX2zZk2x9g6VRpqM9ETdzuGg_yS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 suspectscore=0 malwarescore=0 adultscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 phishscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610230055

On Mon, Jul 06, 2026 at 12:35:41AM +0300, Laurent Pinchart wrote:
> The DT binding for VGA connectors allow providing an EDID blob in the
> device tree when the DDC signals are not connected. This is useful for
> devices where the VGA connector is internal and a display is guaranteed
> to always be connected.
> 
> Support this feature in the driver by parsing the EDID from DT if
> available. If a DDC bus is also specified, return an error from the
> probe function as DDC and hardcoded EDID are mutually exclusive.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
>  drivers/gpu/drm/bridge/display-connector.c | 31 ++++++++++++++++++++--
>  1 file changed, 29 insertions(+), 2 deletions(-)

Having stumbled upon a similar issue for non-VGA connectors, would it be
better if this is moved to the drm_edid.c? We already support
per-connector overrides and then loading the EDIDs from /lib/firmware
via the edid-firmware. Would it make sense to extend / reuse the same
mechanism? For example, enough of the LVDS panels come with the EDID
(and EDID lines) being wired, but in some case we might want to supply
the EDID (via the DT or via the request_firmware()).

-- 
With best wishes
Dmitry
