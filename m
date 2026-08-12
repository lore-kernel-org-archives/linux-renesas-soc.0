Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B09FE3EF0A6
	for <linux-renesas-soc@vger.kernel.org>; Wed, 12 Aug 2026 09:13:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786526015; cv=pass; b=gF9ssAwwTxo7eQLuj4iVFz567ewPiW9UeZklBpCqtY3d/x6nqS2Ee6W10kggpy6xmBvrJstjldoNOeOEe5CET7MtPPju+ONyciLeUrWhKXxQKLNwhpi7dirdCL3XJVNU7DJKAq0aFQKQdUJoI/un1xA6dAScbjtxFoHQvdJLAEI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786526015; c=relaxed/simple;
	bh=pJ58fmyCdHIbf6YFz+UW6V5LKxxv2CXgSBLGdsUGCLU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hlN2hGYhVPwxJMqTD81vptG0zddvRHceBQS69MClwBsaq/zKelOTFvCfrGYyrCjy4toTArDJuPKj+xOFnIYeCD5fa1iCahmZ4sBUGbnRwyZN3R6ivC7qsd0FIy1k7EPmYXGMwmfYBTcHZFyO4txuBfyMkNYIbPz3+Y8CIXGs+oQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FUu2gPzU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Qd20KDWU; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FUu2gPzU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Qd20KDWU"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67C8YY5F3210584
	for <linux-renesas-soc@vger.kernel.org>; Wed, 12 Aug 2026 09:13:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dpzFkmskNZg7AMdz+kZYsxcceuiet2YKHx6mUu4RCCg=; b=FUu2gPzUjVvuBu/y
	LUVY6Az+qq7MriFzOo9fcGIh7R77NRqK6iif8bI5hRJjzLhXyCFRN0KhgoXHelcz
	y7OZxgI86QLf2GxFtRYnaOEpFphKeBzHigHJKTnHivlLXrwQD1Nn279l63lELnK1
	REUa2gn4WwKr9vHT2USqqntX4oZEbnGsSoNivKA7cEWFBOQ8H3ngjGVdRwb9zAZL
	MV914v1jZRwJqeBr5Xg/pkmmymF1wbPnrQSsPYFArs+A6PI+rj7XZxhZCEKmRpnc
	rCHnkTI68e3s1zt6HAv9ErzpG3Kud1z1fVvk1RakLNWwA/WgxnQXxlazpq34Ypnb
	zqhcaA==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g0hj1h2q2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Wed, 12 Aug 2026 09:13:32 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-738627c7908so186966137.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 12 Aug 2026 02:13:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786526012; cv=none;
        d=google.com; s=arc-20260327;
        b=iPKk1pwrLzxSr+0cFqdmBfcORRMHdSU9yRxF41MJGrWWHA8orqQK8weScnRQB/4hOJ
         Pqnegub3ExF0/u9FWth5cOmT4OVdcMqpAs2w1dq6yaZpZ7+HpzBUSvOQwkOzNWuiKoLe
         ZySfFoP+g/fNiuT20xbzSMC/gNVvFSu7ElFth2Hr/qxZsSQIsoIdKcXsJDKqTg6J/JXK
         LKZ8GT3CcDafHwsnrgkjWKf6r1yEVhQ621Eo25ChZq6ZurE7MY4Uc3fTbuoaGyaBm1AB
         dna5KxleAv6iquwOReKkZU5zNE0iHFqWvi3oPCStV7akSHklQiz6kFj5OEToeZ2HYEpZ
         PLAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dpzFkmskNZg7AMdz+kZYsxcceuiet2YKHx6mUu4RCCg=;
        fh=w8rmHkWWQ4Tb4QJuJ06ob2lSSr5+0a23KZVdIzSKgo4=;
        b=SftNXhIhhuSKit0CoyPuTahRVzTF/x79UVmXcAwZHQv1wczEKpwavMcDskBJUuK+sy
         U7HPDa2JT3hENH1pWYImveB5a6gB8N18B+R+liifGKRbK8+v2PB6zHmQOcl+VPtdvnsN
         Om6W2EqslDeY2sTnJOuzKDlNVvMq5UuaceM7Blm5PNjT9IdznEWR8sxRsBMxSwE6Apl0
         oINKcKID8Z/Gc2me7T5pWr4przbUeVIK0HOWlPVqSZZWcmpWSb0hIzrOP/wQLwnvWXfZ
         jb9UsvQQmK/1NJwcq+KWOmClV8wHtoMmA4zCDbVSd36cWjhyoivNchRl8u+ULTqYdWAn
         v08g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786526012; x=1787130812; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dpzFkmskNZg7AMdz+kZYsxcceuiet2YKHx6mUu4RCCg=;
        b=Qd20KDWUF6vLHzRbxG4WezKtkNQ9ZSTBlllLXYlb7FUyDy0C1RfotEN4kdMdy62/Xu
         Xc/u5xJFPsuaGWvJwzaJGuETQM+jCcWDnBldTv/4BQbJXJTq8W9ZJa4+qMY4T9Vv6X0j
         KObd2Hx4pv5hHIg903rbtHyIP7cC//inmrsz2LPdyYbY/qLFFX0SIJpdImEtfy3VUzFQ
         n4g6qzo57tITl/rUiiytK7jCva/3pGbc2hIw/0T46YWT+gUZYq/c0DBYrSeGMPOJ8783
         wjzeX8Ov8wjpxziQqZlghbjjG790B1JMh2BJflpkG21ph/DpNPo91J758Zdk7h4M8B0Z
         X9Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786526012; x=1787130812;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dpzFkmskNZg7AMdz+kZYsxcceuiet2YKHx6mUu4RCCg=;
        b=HNMy5X+oR4axz6of1PUhOCldwbYn4chbcF+XtX8bUZCE7rQJi2YkDcYfaIuizrojy+
         A8xoTkaMKUiOt4HVjdx8RCsoGbc2NM8d1UbCIiU0zEl5CYizznWQ8Hf0rtedyl5eHkve
         M/G+4JFaCWMv4JY9q41nsXKXPdy+xolDyDKY+bIHHQ4q/wq4mfDNNsL0upwgJ8BvmkXt
         1Ngk9bZAqRshw3NBPgo4BQm73H8wiDQ4ouWSEY2hIljghSj0YUuZ4LkHTMYWHwU/lyOB
         TVz2IwdG2CU304Nayn952IFEOPDSDDUsKz9OVbi8d49NmJj7yf5X9IMvxg8+4gR61mpt
         nJMA==
X-Forwarded-Encrypted: i=1; AHgh+RrFeyuiRuM69tqQjrZKjA8AsY9nAX/6bs+3OISPGuOdDddx77f8ud/XtyHuV8oCyAvOtzPJo0pEcHxTm62neSs7zQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwpqB5aba3FijQdY6WgCyP0GmiYMFRcKDapdadCT+2xi9SczCoP
	Z5oktvH0/JVctCc/pecPFroB1JpBI7UdkPf+KeXzQqAIIVtrkryXhf0bOwyVNGvaYYRzB89iIK+
	1hz6uDOagRxQnNEnAwcFy1NbkNzKC94KjsE4kwEzfAFxrpNfSj6n0j0UCqQAlmZCJhKAtxPLVJW
	dvhjXq4pV6VBlT1iRspruxkPdvR9vOyh2IG5+uvviqo9V6nGAvOyMmB4rE
X-Gm-Gg: AR+sD101GMrfs61HuxrLakDwwv59w6AJ28MBfqm1XhUoBdiAaXdp20Ooy7WieYw0E13
	24HeeKrVH5fRrCz4XxvfqjnghWPs8Cz0MTlP5HkodkuvjjW2A3G5+OgmabboqHlBeWmjrXVWjmR
	DhKoLkb6kDgFdBKqhLVcbdYWsZA/M0GsA/oRuPrX8CtxWANpesdhOayyWC1AzoH6MPhIQLQ8mYL
	XCGNMKo8z31KeW3Vw==
X-Received: by 2002:a05:6102:6b03:b0:740:2664:801b with SMTP id ada2fe7eead31-76c8a56a46emr668995137.11.1786526011741;
        Wed, 12 Aug 2026 02:13:31 -0700 (PDT)
X-Received: by 2002:a05:6102:6b03:b0:740:2664:801b with SMTP id
 ada2fe7eead31-76c8a56a46emr668981137.11.1786526011277; Wed, 12 Aug 2026
 02:13:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <ca49000fa84275242b10b8ba1f00e7d6d2bec654.1786474830.git.geert+renesas@glider.be>
In-Reply-To: <ca49000fa84275242b10b8ba1f00e7d6d2bec654.1786474830.git.geert+renesas@glider.be>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Wed, 12 Aug 2026 11:13:19 +0200
X-Gm-Features: AUfX_mxRW5mPsMv22oGSUwbe8-cPintEbnOTSAu73ZO-Z_ZusISLPWDTTJ_Kot8
Message-ID: <CAPx+jO_5346vrt2=t6a7N3TspmsKES9tbcPXUo-h=2qfQV+jtQ@mail.gmail.com>
Subject: Re: [PATCH v5] pmdomain: renesas: Add R-Car X5H MDLC driver
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Ulf Hansson <ulfh@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
        linux-renesas-soc@vger.kernel.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: gmVd2leOa5R8zjcWV03DoOxl18gfXLQY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDA3MyBTYWx0ZWRfX1ibE0C4wYQ7Q
 arq1EHzzyfqhaXaacGdj69gG49bwVIscwxD0KGrOJ/P62NfHuBIiOF68KshHCz+RYv8VmJ3uIiO
 OS3YrPt5Mk0Hj+Eaz5AHpCmlTGeH4vFa05VvCfYmJNIRs2cDlNG2ZjJkJKCAqEo4Czg7ihNplNo
 84rXAWMgJWO70NpzHB8h3IqgdTwq2iOP1bpp7USXmU5gO/YI1m9PXAEd3RohpjioOKGy34HX7Kt
 0tDjS7QDX4JRWWGg70VhvdoJC39IZZJ+6TYU2nqnEQwhJ5kEG6rrKkTBp5vyMYyEjuVyfq4XAxZ
 wPKMznUaRrTjs9vWonALO11dWaQwQHaSRsHsI7dmrIP+AD3CBr22AqJ4TqWQJJhWgJCSnRpQV7y
 YwXqwLyu1aQb83eRhCujm2ISD94czkqOFgtKJpHYcSHjskYLQFNzJcvYcc/+1VaRXFaLdma6Y72
 6F0c9qxAOSGPIY5NCOg==
X-Authority-Analysis: v=2.4 cv=K6ES2SWI c=1 sm=1 tr=0 ts=6a7c393c cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8 a=Or6NOBVec2B0dDILNBIA:9
 a=QEXdDO2ut3YA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-GUID: gmVd2leOa5R8zjcWV03DoOxl18gfXLQY
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDA3MyBTYWx0ZWRfX7WnV3wbVLbqn
 aY69GOnU/hgaHnjfMK4G6pVX8/l6823ZpCuYJDPDrVhicghcEaexqBa+sRNtWspHF4b8SPZJ5Uh
 kQDhjlgPU9diZHDVbQE/A8Es/ns/zPQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_02,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 adultscore=0 bulkscore=0 impostorscore=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608120073

On Tue, Aug 11, 2026 at 9:04=E2=80=AFPM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
>
> Add a minimal Module Controller driver for the R-Car X5H (R8A78000) SoC.
> For now this just supports the always-on power domains, and dummy module
> clocks and resets for the serial console (which is enabled by the boot
> loader).
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Applied for next, thanks!

Kind regards
Uffe


> ---
> v5:
>   - Drop redundant pd_spec.args_count check in
>     r8a78000_mdlc_attach_dev(),
>
> v4:
>   - Extract from series "[PATCH v3 0/6] R-Car X5H CPG/MDLC support"[1],
>   - Rebase on top of pmdomain/next,
>
> v3:
>   - Replace <linux/mod_devicetable.h> by more specific
>     <linux/device-id/of.h> in v7.2-rc2,
>   - Add a comment to document only always-on domains are supported,
>   - Consistently use /* sentinel */ for zero sentinels,
>   - Drop trailing commas from sentinels,
>
> v2:
>   - Spin off from "pmdomain: renesas: Add R-Car X5H MDLC SCMI remapping
>     driver",
>   - Add default support not using SCMI,
>   - Drop all SCMI remapping support,
>   - Document use of -1 as a sentinel,
>   - Rename struct r8a78000_mdlc_info to mdlc_info,
>   - Print HW IDs in hexadecimal,
>   - Reduce log level for unsupported MDLC instances from warn to dbg,
>
> [1] https://lore.kernel.org/all/cover.1785941595.git.geert+renesas@glider=
.be
> ---
>  drivers/pmdomain/renesas/Kconfig         |   4 +
>  drivers/pmdomain/renesas/Makefile        |   1 +
>  drivers/pmdomain/renesas/r8a78000-mdlc.c | 325 +++++++++++++++++++++++
>  drivers/soc/renesas/Kconfig              |   1 +
>  4 files changed, 331 insertions(+)
>  create mode 100644 drivers/pmdomain/renesas/r8a78000-mdlc.c
>
> diff --git a/drivers/pmdomain/renesas/Kconfig b/drivers/pmdomain/renesas/=
Kconfig
> index b507c3e0d723efc6..f2f52d3c29a083f1 100644
> --- a/drivers/pmdomain/renesas/Kconfig
> +++ b/drivers/pmdomain/renesas/Kconfig
> @@ -13,6 +13,10 @@ config SYSC_RMOBILE
>         bool "System Controller support for R-Mobile" if COMPILE_TEST
>
>  # SoC
> +config MDLC_R8A78000
> +       bool "Module Controller support for R8A78000 (R-Car X5H)" if COMP=
ILE_TEST
> +       select RESET_CONTROLLER
> +
>  config SYSC_R8A7742
>         bool "System Controller support for R8A7742 (RZ/G1H)" if COMPILE_=
TEST
>         select SYSC_RCAR
> diff --git a/drivers/pmdomain/renesas/Makefile b/drivers/pmdomain/renesas=
/Makefile
> index 0391e6e67440a786..17849aad37a5ac4f 100644
> --- a/drivers/pmdomain/renesas/Makefile
> +++ b/drivers/pmdomain/renesas/Makefile
> @@ -1,5 +1,6 @@
>  # SPDX-License-Identifier: GPL-2.0
>  # SoC
> +obj-$(CONFIG_MDLC_R8A78000)    +=3D r8a78000-mdlc.o
>  obj-$(CONFIG_SYSC_R8A7742)     +=3D r8a7742-sysc.o
>  obj-$(CONFIG_SYSC_R8A7743)     +=3D r8a7743-sysc.o
>  obj-$(CONFIG_SYSC_R8A7745)     +=3D r8a7745-sysc.o
> diff --git a/drivers/pmdomain/renesas/r8a78000-mdlc.c b/drivers/pmdomain/=
renesas/r8a78000-mdlc.c
> new file mode 100644
> index 0000000000000000..2668fc2ac9cbd388
> --- /dev/null
> +++ b/drivers/pmdomain/renesas/r8a78000-mdlc.c
> @@ -0,0 +1,325 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * R-Car X5H Module Controller
> + *
> + * Copyright (C) 2026 Glider bv
> + */
> +
> +#include <linux/dev_printk.h>
> +#include <linux/device-id/of.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_domain.h>
> +#include <linux/reset-controller.h>
> +#include <linux/slab.h>
> +
> +#include <dt-bindings/power/renesas,r8a78000-mdlc.h>
> +
> +struct mod_map {
> +       int hw_id;              /* Hardware module ID or -1 sentinel */
> +};
> +
> +struct mdlc_info {
> +       u32 base;
> +       const struct mod_map *mod_map;
> +};
> +
> +/**
> + * struct r8a78000_mdlc_priv - Module Controller Private Data
> + *
> + * @link: Link into list of MDLC instances
> + * @genpd_data: PM domain provider data
> + * @rcdev: Reset controller entity
> + * @dev: MDLC device
> + * @np: Device node in DT representing the MDLC
> + * @mod_map: Mapping from hardware module IDs
> + */
> +struct r8a78000_mdlc_priv {
> +       struct hlist_node link;
> +       struct genpd_onecell_data genpd_data;
> +       struct reset_controller_dev rcdev;
> +       struct device *dev;
> +       struct device_node *np;
> +       const struct mod_map *mod_map;
> +};
> +
> +static struct generic_pm_domain *r8a78000_genpd_always_on;
> +static HLIST_HEAD(r8a78000_mdlc_list);
> +static DEFINE_MUTEX(r8a78000_mdlc_lock);       /* protects the two above=
 */
> +
> +static struct generic_pm_domain *r8a78000_genpd_xlate(
> +                       const struct of_phandle_args *spec, void *data)
> +{
> +       struct r8a78000_mdlc_priv *priv =3D container_of(data,
> +                                       struct r8a78000_mdlc_priv, genpd_=
data);
> +       struct device *dev =3D priv->dev;
> +       u32 id;
> +
> +       if (spec->args_count !=3D 2)
> +               return ERR_PTR(-EINVAL);
> +
> +       id =3D spec->args[0];
> +
> +       if (id >=3D R8A78000_MDLC_PD_AON) {
> +               dev_dbg(dev,
> +                       "Mapping HW power domain 0x%x to always-on domain=
\n",
> +                       id);
> +               return r8a78000_genpd_always_on;
> +       }
> +
> +       /* For now only always-on domains are supported */
> +       dev_err(dev, "Unknown power domain 0x%x\n", id);
> +       return ERR_PTR(-ENOENT);
> +}
> +
> +#define rcdev_to_priv(_rcdev)  \
> +       container_of(_rcdev, struct r8a78000_mdlc_priv, rcdev)
> +
> +static const struct mod_map *mod_map_find(const struct mod_map *map, u32=
 id)
> +{
> +       if (!map)
> +               return NULL;
> +
> +       for (; map->hw_id >=3D 0; map++) {
> +               if (map->hw_id =3D=3D id)
> +                       return map;
> +       }
> +
> +       return NULL;
> +}
> +
> +static int r8a78000_mdlc_reset_xlate(struct reset_controller_dev *rcdev,
> +                                    const struct of_phandle_args *spec)
> +{
> +       struct r8a78000_mdlc_priv *priv =3D rcdev_to_priv(rcdev);
> +       struct device *dev =3D priv->dev;
> +       const struct mod_map *map;
> +       u32 id;
> +
> +       if (spec->args_count !=3D 1)
> +               return -EINVAL;
> +
> +       id =3D spec->args[0];
> +
> +       map =3D mod_map_find(priv->mod_map, id);
> +       if (!map) {
> +               dev_err(dev, "Unknown reset 0x%x\n", id);
> +               return -ENOENT;
> +       }
> +
> +       dev_dbg(dev, "Ignoring HW reset 0x%x\n", id);
> +       return id;
> +}
> +
> +#define DEFINE_MDLC_RESET_WRAPPER(op)                                   =
   \
> +       static int r8a78000_mdlc_ ## op(struct reset_controller_dev *rcde=
v, \
> +                                       unsigned long id)                =
   \
> +       {                                                                =
   \
> +               struct r8a78000_mdlc_priv *priv =3D rcdev_to_priv(rcdev);=
     \
> +                                                                        =
   \
> +               dev_dbg(priv->dev, "%s: Ignoring\n", __func__);          =
   \
> +               return 0;                                                =
   \
> +       }
> +
> +DEFINE_MDLC_RESET_WRAPPER(reset)
> +DEFINE_MDLC_RESET_WRAPPER(assert)
> +DEFINE_MDLC_RESET_WRAPPER(deassert)
> +DEFINE_MDLC_RESET_WRAPPER(status)
> +
> +static const struct reset_control_ops r8a78000_mdlc_reset_ops =3D {
> +       .reset =3D r8a78000_mdlc_reset,
> +       .assert =3D r8a78000_mdlc_assert,
> +       .deassert =3D r8a78000_mdlc_deassert,
> +       .status =3D r8a78000_mdlc_status,
> +};
> +
> +static int r8a78000_mdlc_attach_dev(struct generic_pm_domain *domain,
> +                                   struct device *dev)
> +{
> +       struct device_node *np =3D dev->of_node;
> +       struct r8a78000_mdlc_priv *priv;
> +       struct of_phandle_args pd_spec;
> +       const struct mod_map *map;
> +       unsigned int id;
> +       int ret;
> +
> +       ret =3D of_parse_phandle_with_args(np, "power-domains",
> +                                        "#power-domain-cells", 0, &pd_sp=
ec);
> +       if (ret < 0)
> +               return ret;
> +
> +       scoped_guard(mutex, &r8a78000_mdlc_lock) {
> +               hlist_for_each_entry(priv, &r8a78000_mdlc_list, link) {
> +                       if (priv->np =3D=3D pd_spec.np)
> +                               break;
> +               }
> +       }
> +
> +       if (!priv) {
> +               dev_err(dev, "%s: MDLC %pOF not found\n", __func__, pd_sp=
ec.np);
> +               of_node_put(pd_spec.np);
> +               return -ENODEV;
> +       }
> +
> +       id =3D pd_spec.args[1];
> +       of_node_put(pd_spec.np);
> +
> +       map =3D mod_map_find(priv->mod_map, id);
> +       if (!map) {
> +               dev_err(dev, "Unknown module 0x%x\n", id);
> +               return -ENOENT;
> +       }
> +
> +       dev_dbg(dev, "Ignoring HW module 0x%x\n", id);
> +       return 0;
> +}
> +
> +static void r8a78000_mdlc_unlink(void *data)
> +{
> +       struct r8a78000_mdlc_priv *priv =3D data;
> +
> +       scoped_guard(mutex, &r8a78000_mdlc_lock) {
> +               hlist_del(&priv->link);
> +       }
> +}
> +
> +static void r8a78000_genpd_del_provider(void *data)
> +{
> +       of_genpd_del_provider(data);
> +}
> +
> +static int r8a78000_genpd_always_on_singleton(struct device *dev)
> +{
> +       struct generic_pm_domain *genpd;
> +       int ret;
> +
> +       guard(mutex)(&r8a78000_mdlc_lock);
> +
> +       if (r8a78000_genpd_always_on)
> +               return 0;
> +
> +       genpd =3D kzalloc_obj(*genpd);
> +       if (!genpd)
> +               return -ENOMEM;
> +
> +       genpd->name =3D "always-on";
> +       genpd->attach_dev =3D r8a78000_mdlc_attach_dev;
> +
> +       ret =3D pm_genpd_init(genpd, &pm_domain_always_on_gov, false);
> +       if (ret) {
> +               kfree(genpd);
> +               return dev_err_probe(dev, ret,
> +                                    "Failed to create always-on domain\n=
");
> +       }
> +
> +       r8a78000_genpd_always_on =3D genpd;
> +       return 0;
> +}
> +
> +static int r8a78000_mdlc_probe(struct platform_device *pdev)
> +{
> +       struct device *dev =3D &pdev->dev;
> +       struct device_node *np =3D dev->of_node;
> +       struct r8a78000_mdlc_priv *priv;
> +       const struct mdlc_info *info;
> +       struct resource *res;
> +       int ret;
> +
> +       ret =3D r8a78000_genpd_always_on_singleton(dev);
> +       if (ret)
> +               return ret;
> +
> +       info =3D of_device_get_match_data(dev);
> +       if (!info)
> +               return -ENODEV;
> +
> +       priv =3D devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +       if (!priv)
> +               return -ENOMEM;
> +
> +       priv->dev =3D dev;
> +       priv->np =3D np;
> +
> +       res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +       if (!res)
> +               return -ENODEV;
> +
> +       for (; info->base; info++) {
> +               if (info->base =3D=3D res->start)
> +                       break;
> +       }
> +
> +       if (!info->base) {
> +               dev_dbg(dev, "Unsupported MDLC instance 0x%pa\n", &res->s=
tart);
> +               return -ENODEV;
> +       }
> +
> +       priv->mod_map =3D info->mod_map;
> +
> +       scoped_guard(mutex, &r8a78000_mdlc_lock) {
> +               hlist_add_head(&priv->link, &r8a78000_mdlc_list);
> +       }
> +
> +       ret =3D devm_add_action_or_reset(dev, r8a78000_mdlc_unlink, priv)=
;
> +       if (ret)
> +               return dev_err_probe(dev, ret, "failed to add action\n");
> +
> +       /* Note that no actual domains are registered, just need translat=
ion */
> +       priv->genpd_data.xlate =3D r8a78000_genpd_xlate;
> +       ret =3D of_genpd_add_provider_onecell(np, &priv->genpd_data);
> +       if (ret)
> +               return dev_err_probe(dev, ret,
> +                                    "Failed to register genpd provider\n=
");
> +
> +       ret =3D devm_add_action_or_reset(dev, r8a78000_genpd_del_provider=
, np);
> +       if (ret)
> +               return dev_err_probe(dev, ret,
> +                                    "failed to add unregister action\n")=
;
> +
> +       priv->rcdev.ops =3D &r8a78000_mdlc_reset_ops;
> +       priv->rcdev.of_node =3D np;
> +       priv->rcdev.of_reset_n_cells =3D 1;
> +       priv->rcdev.of_xlate =3D r8a78000_mdlc_reset_xlate;
> +
> +       ret =3D devm_reset_controller_register(dev, &priv->rcdev);
> +       if (ret)
> +               return dev_err_probe(dev, ret,
> +                                    "Failed to register reset controller=
\n");
> +
> +       return 0;
> +}
> +
> +static const struct mod_map r8a78000_mdlc_perw_mod_default[] =3D {
> +       { 0x54 },       /* HSCIF0 */
> +       { -1 }
> +};
> +
> +static const struct mdlc_info r8a78000_mdlc_default[] =3D {
> +       {
> +               .base =3D 0xc05d0000 /* mdlc_perw */,
> +               .mod_map =3D r8a78000_mdlc_perw_mod_default,
> +       },
> +       { /* sentinel */ }
> +};
> +
> +static const struct of_device_id r8a78000_mdlc_match[] =3D {
> +       {
> +               .compatible =3D "renesas,r8a78000-mdlc",
> +               .data =3D &r8a78000_mdlc_default,
> +       },
> +       { /* sentinel */ }
> +};
> +
> +static struct platform_driver r8a78000_mdlc_driver =3D {
> +       .probe =3D r8a78000_mdlc_probe,
> +       .driver =3D {
> +               .name =3D "r8a78000-mdlc",
> +               .of_match_table =3D r8a78000_mdlc_match,
> +               .suppress_bind_attrs =3D true,
> +       },
> +};
> +
> +builtin_platform_driver(r8a78000_mdlc_driver)
> +
> +MODULE_DESCRIPTION("R-Car X5H MDLC Driver");
> diff --git a/drivers/soc/renesas/Kconfig b/drivers/soc/renesas/Kconfig
> index 2ab150d04bb1f1ef..d4055250de72f1fe 100644
> --- a/drivers/soc/renesas/Kconfig
> +++ b/drivers/soc/renesas/Kconfig
> @@ -358,6 +358,7 @@ config ARCH_R8A78000
>         default y if ARCH_RENESAS
>         default ARCH_RENESAS
>         select ARCH_RCAR_GEN5
> +       select MDLC_R8A78000
>         help
>           This enables support for the Renesas R-Car X5H SoC.
>
> --
> 2.43.0
>
