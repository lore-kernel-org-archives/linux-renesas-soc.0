Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795620264;
	b=SaFdlnkeZz1rW5v8lJbsFwM0Vr/jtuELaNQwUEC9oOk69H2sLxdwsPoldwuNIH9ttgW8
	 8PhoMHmUXhbg2E1ILI7cLk68/ZybbUoFGeX/QKzh3GishUt2rvollzsWh7mPIThaCqjHb
	 3/Js+11l9cIcti1V6a3dUx8YKR0MKbMK/yJ9IhaBhtw5Nu9V9/cchaDdVTR6u1JERaG1E
	 6tyfNGvgQFxJN5kESM2zHeUoyRk5UkLbLOmDFuMVG+wej5ySdB6uSwYkYge4nXVPxMm4k
	 MEWRymIgx7dPufUulzWYpdvWJZSiB8EkFRHnZNJDQbwnFMH7KNHDDCQfA+Kl3UF2YvA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795620264;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=cAOpd8pWTb9jYj9oRh4JEDwRl6xgzzqz7YACPIDpZgU=;
	b=gqCR1pL2/QL+823rCEdXgksuCjmaksPyT1jF7hdLCA/DggsG9HRjXvrJotzY/fUlS57r
	 HEaVA6GvBrz1BQEn9WD4k0zi4c8mR7x3S5v4UAHSzEGZv7egG3nA/pNriikvRVHehGG0Y
	 dMOV3kSTlwz6n+YxnM39dd1MEMlcF1gW4UHpHY2OUa6VqZBuFyG9//J5fGV9rIHBgs7Qp
	 pr29AFXhfGiFU6cXg2tZXujHFBSdxpIL9/DcauMsEkIU/aDX+vYlc1A1STVWkLpbtp+e9
	 pqCrNswm7+1zqZyxnacsFo17wE7oJc5ftDk+VN2Q8gKX4NR9VXafeVxkeqWOSMvSFDQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jpbdRQEC;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JOUmSRAJ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4389F606A327
	for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Nov 2026 15:24:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4389F606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jpbdRQEC;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JOUmSRAJ
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6APEM3qi047556
	for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Nov 2026 15:24:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cAOpd8pWTb9jYj9oRh4JEDwRl6xgzzqz7YACPIDpZgU=; b=jpbdRQECJn9dd0rd
	YCzlMvxKh1E2FuxDCRdZgzLYxR58MASQ/lLJbK7mQZPHj1Gv6CsJ0tKvAJ6xMV/M
	gffkkQJSBTkiChotyI1wk1WWAybtK54prCKnQMFZH+eQ8C9VeCjTQScGYlMh0AON
	GmPvD0irgjac0Z0b+QcJN15xfbB9OBHRPmqm+yD2YYvref173bokKukzcTD7iYIr
	nKr2JqhbWduQYUrgWQQgIHZOcB9rEEmQ24/8vdV4MJ/APNNo2e6fRI6+Iz+0oc8I
	MH4oUuVBaeTRylx1QzrZUteb5v4YJcTw2b8S7RnbKVSkU322pPGVZo5XnxMUZQEc
	e0rN5g==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5mc2bgwp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Nov 2026 15:24:22 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc4216aee8fso6637220a12.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Nov 2026 07:24:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795620261; cv=none;
        d=google.com; s=arc-20260327;
        b=UeT0xEmMi51nt9tUT4fnTisYMwAv2h21gHRaLS02QRtKQqB51BlF0eSbbHHeyNff2A
         A5N0Vi4cynR4B4RrUvtiof/mhq3xTlGTPlS+yLBdGM8fxJybI2o67SGb8AFQizZb8kzB
         4Fi7x6IMC5qSbO3KEdg5jPj7TnQQChH/eyAJ7lJNlWRxOFXJ10jaqYnCD/j3DmbQ6bQc
         xlgW1JDGN0/UF+yqx0+JvYxMwc+L6TVjitOqeacKU/W5UG17JSL7HPROxjrhgCF5h+2l
         FxfzgxHQV4fdxIkxDqNSYG8JsgDfhXihAft6bTjBM5B5RQ6Q3sEZ2QbqDw75+48MMXSI
         sQXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cAOpd8pWTb9jYj9oRh4JEDwRl6xgzzqz7YACPIDpZgU=;
        fh=v1CP7YdaHCXe/Qz9enqvbbnkZCLQ+VZIVlli7rZstzU=;
        b=Lf798mkpzLAXSYDNHO1uZGJPAgdhfR5oi7wiNN4b9SMVCL/xmdCInUSgLd2HzZiZ1U
         MVBNae9ne3fMieZra+SjUcDoWFdDh1b1bNcHB8NOdo6onkSTzS4sI3mW1BNYjiRt2EYK
         c0LdzdvvjrKMqBzYgBE19Ij2f2x8c+tewlpgpzbj1KMEyNDhccbTlXpv4TmYmRzdgEvO
         kDDU47AqCnI7q2Ri3rL4rB4qD1l239zBRMU9SxxHYAkwh7KgKX4laju+g/FAZvi1LKWV
         p/niBGIjtXBguDMBuaOFGTACRjfrE4IhSTvikBM5sV/XGxW15fTSaQzHaRalCPvxbvDd
         LscA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795620261; x=1796225061; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cAOpd8pWTb9jYj9oRh4JEDwRl6xgzzqz7YACPIDpZgU=;
        b=JOUmSRAJMjCviWfrKPzXLdwZgpvlk6WlhGFfT2z/yHl8Ch3saIBnQJiB2SEPcrTvWw
         dR1l1L8pRR+VfSzGt/GizrZxD5DipQDmF9wkPuhlDPAcb3OZBtCcyd5PZE22o6Yvl5rh
         m48o9IR/ddRF+LFx8PQ+tnr92Sb0q6sY20K0nQzVUPz8Dr8XzuLUFP2Q+HltPpoZzekb
         CT44bBAyzjWyhKvoeNgpg6DRqFJOmbPGY3acT+c1AMZ6Tbs5GchHCQiNqn3y5AFmwTK7
         dk+gJfO4Fam2LVYsWc1R+d4o4Rgf5em9/fKI3iCotf3rYydXPz95cUZaLsl7xAsW7Ltv
         CkvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795620261; x=1796225061;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cAOpd8pWTb9jYj9oRh4JEDwRl6xgzzqz7YACPIDpZgU=;
        b=ISOld38HNqbFQLSTvt2FyCtKoQcU9PC1CUOj7j0tml0NOpZv5nHDizoIQ1eKN97Hg/
         lFcdXpt+1eSh6RyekwU8D61M7zyweDnKNoYqomx6XICUKm9VA/a8k0xzHusWOh8fgTxZ
         AQ8/3ikqaMVa5Wp87byOBirGCkkpxFb+4dK1W3Dw2aarasCbcAMkuYewcbPNYtafMrXc
         yW/7GUK5K2SNk+u9aNGgImscylBNbUQQFLUIE9SwWHw2rYCz74lee/AsDQmc+RfId4lr
         zR8qAdZvCjW638rU0EC8LDPCS740IBef/tiimUcRBBHOZHkduE7FepRPBNMwYrQjTOK0
         Oh9Q==
X-Forwarded-Encrypted: i=1; AL+hErGY2/31jqxnP2209WlSBp8esNvXvPuMJCZ1qb26W/rEmpva/G5A4rrenz7D6XQzP4VxP5se2wL7Mj3uMO2OA1ygmQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z88Z5peoxwaLMEzSrY+HMz/JrG6ZFO6ugPPaZji6TcuH6QjJ1vC
	MVf/a03w3Qcx0sDl/6olncKWSrzhQGQKsOS3i3XGmHugMKdJQmD78l7876NIeVPHPRmsJDe9XBH
	h+0rna0s9Os0WkqAiVntC3a+L1OPZmkZ1YEnzir/NYxU9biGIPht/oK9jZGQI8HA8GF2so15PaH
	JM8YgUU7Q0FIfHh6NUgzKipgEpUVkGagC2lw1gcXVFyXz5VqkxY1FjRcCV
X-Gm-Gg: AZFdTZddrE5YryVGg/zupxRgBn+DpWyLCjxsJdTpdBq3qzBVB8EHjJLaqaIlGE9jOg2
	akQGvzc2smYaMGN8nu+QLEhvkiOvbndE32Ic41jCdiNm7L4fvERytC1Rww65IU5QB6pGcQXsY5d
	mLTJB4+JPBI/7TCD8P3/IttPBZhjUIgfAsBvySXjcD0kbgeQXar5KQ8xAVMg==
X-Received: by 2002:a05:6a20:ef1a:b0:3fa:d354:9708 with SMTP id adf61e73a8af0-4014d35e690mr16693110637.47.1795620260981;
        Wed, 25 Nov 2026 07:24:20 -0800 (PST)
X-Received: by 2002:a05:6a20:ef1a:b0:3fa:d354:9708 with SMTP id
 adf61e73a8af0-4014d35e690mr16693057637.47.1795620260386; Wed, 25 Nov 2026
 07:24:20 -0800 (PST)
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1795029012.git.geert+renesas@glider.be> <37ddba45a281d2957effe5773c59022835b6144c.1795029012.git.geert+renesas@glider.be>
In-Reply-To: <37ddba45a281d2957effe5773c59022835b6144c.1795029012.git.geert+renesas@glider.be>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 16:24:09 +0100
X-Gm-Features: Aa3M54rJMX4qh8HyzUvWFdsjdwQqxq_0OhXrr7tr5X8J3Des22u394yZEZEfoS8
Message-ID: <CAPx+jO9Ao4mR5wq_GTQOegLyYfgf6xpq+zz1tTwU_U7BULeb7A@mail.gmail.com>
Subject: Re: [PATCH v5 08/15] pmdomain: Make genpd_get_from_provider() always
 return on first match
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Ulf Hansson <ulfh@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Marek Vasut <marek.vasut+renesas@mailbox.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Kevin Hilman <khilman@baylibre.com>, Vinod Koul <vkoul@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Paul Elder <paul.elder+renesas@ideasonboard.com>,
        =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>,
        Sudeep Holla <sudeep.holla@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>, arm-scmi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=aPJlOr9m c=1 sm=1 tr=0 ts=6b06fda6 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8 a=P1BnusSwAAAA:8
 a=iT_-64JVffYfEt0vB_EA:9 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
 a=D0XLA9XvdZm18NrgonBM:22
X-Proofpoint-GUID: -vZgvrJ2CI-venshPeFXtFYsaLujjaO7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA2MSBTYWx0ZWRfX67LMZkFT+AJ5
 a9iYZVzMKzVF5cISXRQI+08mESDIZjcZzY0D1IV6GdZ+rtri2AZzHNvfBKd2KFvjWxA+GRdCViC
 nCKVfo+Hl5PM7z6edsd88sPE6qQ/UB4axRvRqMx9Jgkslda3lVRQRihhVpLZKTicugURzRCLMBL
 Pfwo4bDExqdsT7kssK1gGBX7+KBNv2xi/zE6W4UJb4efMk0r2MMmXTe//uW1G7qP/2dzfqvi3Xu
 EgZUCvkSgg7uvQftJ1ngJZ5Us/QINqBHZnCEKo3pC081pwFizLrXdaDMCSOyEVNGu/tGl7lFKHK
 ojXyfl5pkK2Q5QWm3e0NSe01tdpZkbvL6G6FekNDjar6ltE1HPC3ighOkxcHBJxSH2u7U83eBjZ
 tIYOV9Sj5zcVY3CTWulBZe1FJBGF78umP9CyXXPeun6skt1YVkrf6eGiPR1K371Q958Xv7mvxQy
 jzJWH+vcmBAMqfeF9Mw==
X-Proofpoint-ORIG-GUID: -vZgvrJ2CI-venshPeFXtFYsaLujjaO7
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA2MSBTYWx0ZWRfX/dXG2YEKTaE+
 WWxq+eFoYGZOkx6VZ7ZR4I6/hwB7u508eiN8iV86N0DxlZlCYcE7whKXQICk7HKFa4mxTB55GJs
 4VSDlhcqNj135bKva2173q75kS/TQBg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 spamscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611250061

On Wed, Nov 18, 2026 at 8:46=E2=80=AFPM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
>
> The for-loop in genpd_get_from_provider() seems to imply that one can
> have multiple providers for the same node: in case a provider's callback
> fails to map a specifier to a PM domain, the loop continues looking for
> another matching provider.
>
> While technically one can register multiple providers for the same
> device node, one can never safely remove one of them:
> of_genpd_del_provider() just considers the device node, and removes the
> first matching provider.
>
> Use the same logic in genpd_get_from_provider() to avoid confusion.
>
> Reported-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Link: https://lore.kernel.org/20261019160545.GC3705@killaraus.ideasonboar=
d.com
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Applied for next, thanks!

Kind regards
Uffe


> ---
> v5:
>   - New.
> ---
>  drivers/pmdomain/core.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
> index 964e44c2f78f1d55..ee8075e90852e738 100644
> --- a/drivers/pmdomain/core.c
> +++ b/drivers/pmdomain/core.c
> @@ -3031,10 +3031,10 @@ static struct generic_pm_domain *genpd_get_from_p=
rovider(
>
>         /* Check if we have such a provider in our array */
>         list_for_each_entry(provider, &of_genpd_providers, link) {
> -               if (provider->node =3D=3D genpdspec->np)
> +               if (provider->node =3D=3D genpdspec->np) {
>                         genpd =3D provider->xlate(genpdspec, provider->da=
ta);
> -               if (!IS_ERR(genpd))
>                         break;
> +               }
>         }
>
>         mutex_unlock(&of_genpd_mutex);
> --
> 2.43.0
>
