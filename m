Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46680438009
	for <linux-renesas-soc@vger.kernel.org>; Tue, 11 Aug 2026 10:16:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786443368; cv=pass; b=go72o/13EalRtoHGILJeRbE1ZavksSchMpX9MbCYnTEnKMD7ERPpe7US1rWS6RNV/Ini6uN+neurazv7FYu5pHjaiHJFD4RN5B5mzPp3UFf17KDhwB2kfuYOj4UyF0qi8qcc/udGSs3pzweAvX9Y0zm+52mavLEM4BAN8ZO6nZk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786443368; c=relaxed/simple;
	bh=znnZzewmT/F+iDUDEdTCsDpOgnBadsJdR7cElUaBUOA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e01CPdJWfgDTwhrKAD0iH/kx8tWmQnmOPcRqJal+k74CQ842km4n5MuwJcvXysBM8zRJT9u1zOfMOT+2fTt0x9qc5TGMJV8l1U+iJYbH7W4lDB5o2TZkZwxrD/tr+UNrQD8oQ2aGxjw/d+QY7PBTL/h1sJFDpn/cIpP7csO34v4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FvTFNqLy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iZIHkbwd; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FvTFNqLy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iZIHkbwd"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67B72CRl4156910
	for <linux-renesas-soc@vger.kernel.org>; Tue, 11 Aug 2026 10:16:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	D1A+fYhAaYvLK7iwOnTwEkzymFsvkfIMelFoOJLNgsE=; b=FvTFNqLyABeuXzPB
	JJDdFJyL4xN4kBlV2cIMSnlV4VLON76bY8JUi6orFGZQ10VMbqjaxlk+/rfcPMPJ
	O68fc/ldHJBPO3AKiaUC+LOLzMAgjeTOvphAsgkcpISNxu6oY64QHN8UNIA2/YQC
	hgb9NgXtorLXwL3xqvV8A9pUBbuQOZQrPeoPz95Wgr8BlS7WqtssKv1Jan0So6Sd
	tqPCQnu8jUmLyhxFMKuQuo0BTkbUxQz0xKDy474mcyEPGNQep04Jnk6trQe/A/c8
	cXqbI5i9S+VaY0eN5HlQVzlZc4gSwWBGcvDikgYcYAAE/6Lg5avY7R9f6REuTC+1
	vlr7oQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fyhp8kxxj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Tue, 11 Aug 2026 10:16:05 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c9c26587e67so814069a12.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 11 Aug 2026 03:16:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786443364; cv=none;
        d=google.com; s=arc-20260327;
        b=hbpLcFYQrO7QD2/jJynO1Sn0KiJ3DfwOLGDjjqzYOJUKUvTpyBGi1uSP98qUYgRxf7
         CIjQ9hxOnYpQMN4PpvrRR94+v8MOhx/dNGYMSVU+v8KP+F69RaQVF3EbDnfnsKybguKU
         +fnied6w0FZluTebUbiwc+EmrUIQn52g9Ffy7davl/spbwALc5gpIXYBwhZDFmfl05Pb
         2WAEnYyFb+1SApLOubMHUGjDCmZcwXBpbttBTp8HOk8iYFpR0uXS8P8gxw4Ipl7G3akV
         hMlkfImXzsopDNKUtfjhqziOZaNGymrqEmc3ndTGEaZDPIj7mCKQCWmkfpGIbkFhL4w5
         u+EA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=D1A+fYhAaYvLK7iwOnTwEkzymFsvkfIMelFoOJLNgsE=;
        fh=+BP1WTuKXAD4c2BZclRYsffckmDhPpxbtEMepBhMru0=;
        b=McYfcQuSxz2lFtkNpqa1nurbRW+n50KQRicRx/DBjwuwwLhBcxSSLfTVyEcEjehH+P
         flqt2PhF3iWhCD5+lQiLZLz/n/Fg/xMdxTvh6tG7DBKakm/iFr2zIYbK0hpUo49yhP6Z
         W0Iw9kvyO7kYNa4cPp7w9mn/USM8nFmrBD5Ljn0qi8v8tkApUiuaO7du6Q23vHQcooct
         ZTEPNTbAm3F/Gr1x4C/TPyGsJ/9I14rVuHwSf/qRVqX6rHohC292sXMEvTlrfp6WsQnz
         liY8tf0u1iGSYIdHF/u1/3QtR/W8FGXQkuqXc4N2U2RAP5P7V//pBZHBJbOiw3cdeD0n
         o4qQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786443364; x=1787048164; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=D1A+fYhAaYvLK7iwOnTwEkzymFsvkfIMelFoOJLNgsE=;
        b=iZIHkbwdCgsJfhSU6sBtTRRZ2Lqu9GlrBQoDp62X/3Gxn2OhcV86lV+5R1yefDn6Wo
         CHlJ17RlGX1xiueN7um4BLDFNrBe4xXDjth0SvdOC8kutZdCC/XKn9BdeqW0/oEPQQiE
         ggIq2WEXvlPs9PmBGiBXtkQDX/atCBIx27gXINzvdDoDNMg3+K8Q5FRlyw2Eq8/8tqfl
         soQd7vEmfq/7WBYBFK3Jg9LFchS+0Xtnc/K5iSK7PFNQy4ccW68X9jWKc3iCl/zOWytN
         I/wvjhXl6fW60RwvlzEbf2PNgt7+IKe01U3RFrWKAa6cSNVM79Y8QfMuoEVIzRay/XGR
         maJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786443364; x=1787048164;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D1A+fYhAaYvLK7iwOnTwEkzymFsvkfIMelFoOJLNgsE=;
        b=iTUhKRhysR+2Vb4OcRQMrcT6EsnYRMBZQbR78iAs55QFjeQYkxHfrBb0JDjWMAY3pB
         7QeoPYoNiSEeibJrCqPc4FCT8k8E0WsbO4ABpgpcqNg/8NHiXn2dpORb2r0chhbMuPYK
         /M3gXhHrYMlZ9G5Wdw0Az/WNars3TmrnccRlbynjfjmNSvp/ANtASz/+038c0eAf/8Eo
         e5/VsJQ4PwetQdx4IuFtJhJCanVMv/yR6c91qdXaaVUf6fZxIpLkI2ovzh9AucoDS95S
         FC2GMTiZlXavkC91HML/TjOqq1AwMWmCyURZbsY0a2D0z4eIUavaDlYL9TnJwyvF/ybc
         dsQQ==
X-Forwarded-Encrypted: i=1; AHgh+RonNTYiMl5JN+27rwHTdGipDtAO5WDrG/Uu0AnKE6n2v4xSnT+MS/fcY37BkTiUi/pUW0rWyLqM1YQxBTZr2oscJw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxcWXq0xqg/zIx242DGMxyjZgCVDzhku9/vRK7zCAFdxK/BR1R+
	tlVKLABx4jZOeY/iVgd8mI+jGvXVhga/cdI/92MQ44ky6mUvCEOyTddG+0+Hh5JvPiBDuOfPy8I
	EPdNem704WiDB8A5Diu2bL/McyvVzMIkrWcSM4oEhkJLHdkCsWBfcf1DHdRi/YLdBvHU/7cipj1
	4OdP+/KVRVzECMs2EJDe9sa1dqf7K0sVHjrhqwmwy7MJf0C7p+
X-Gm-Gg: AR+sD10FI1H/xS2Io/59G4F6WmUXFEt+8KHmKj9YVIpfPCtxoRFNkSUXj91lTI5zlW/
	s6nQSYD4Nt4mIAPwjCvtGUzGaOfbFYTxkTzd2NJ4qv3oATf5cssBcyKICp4OnaWKxKngtgUS8wT
	+1aXR4lo38M9doQ4OzktVzUlcMWSc3Z6HNHeaFYYWpoOutBPN72qHBOdfWQQ==
X-Received: by 2002:a05:6a20:9e0e:b0:3b2:8674:9830 with SMTP id adf61e73a8af0-3cc2e09b3a8mr2330214637.14.1786443364307;
        Tue, 11 Aug 2026 03:16:04 -0700 (PDT)
X-Received: by 2002:a05:6a20:9e0e:b0:3b2:8674:9830 with SMTP id
 adf61e73a8af0-3cc2e09b3a8mr2330159637.14.1786443363796; Tue, 11 Aug 2026
 03:16:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <d4bd0cc7f26c1bcdc260edb994b4971cb5dd3a10.1786438424.git.geert+renesas@glider.be>
In-Reply-To: <d4bd0cc7f26c1bcdc260edb994b4971cb5dd3a10.1786438424.git.geert+renesas@glider.be>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Tue, 11 Aug 2026 12:15:52 +0200
X-Gm-Features: AUfX_mzo9d9Ehsy0kJYEaUYUeD_sgjALUKL1j-gAwWg-EJiCOYrFK7gAGqoA0_A
Message-ID: <CAPx+jO-uXbNpFPzbAbDkBQh2-xf4r1NXk2PdQvOh9ZOfEQ71gQ@mail.gmail.com>
Subject: Re: [PATCH v4] pmdomain: renesas: Add R-Car X5H MDLC driver
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Ulf Hansson <ulfh@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
        linux-renesas-soc@vger.kernel.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDA4NCBTYWx0ZWRfXymu5W4z5fHcY
 PU/LIl62Yhb4dMFQ5nWfS+QyIZ70YhVHVv4jl06DRfhaKs+H7vLZSydNb75+IxyEGXTZDz3+DCA
 NfC2V8ZqzNsm8MoGhK8wM0MT0UkfGUM=
X-Proofpoint-GUID: NF2vdYash2E46peuNqqoCyIE7NnCuNNC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDA4NCBTYWx0ZWRfX1MKZbOuFRteG
 t8Xxsp5E9Eo01fotSoI8XFy66M+Rt+7TDwfO8w3p0qrRJ8M3byEfLwtY+DAIF1GnTAuBHak9aZH
 vmKYJBJgBILi+B52TL3RB1Yl0jhA7aKVDAhbZmIAuS5eXHY3pno0XW4UiRd8jZ1njmI5dhF6X+3
 1W4Rz5qoCuufQB84aNfsfpsG/lLMmsHO29jyTHXvVh1hyIyK3MxRRWr0JY5lZrOlCQFJ3D02eZp
 p6tFVX+AVU0gpbU9QA/YWCuln0BizL8NaATYLN/0Y3f9dKhhRVKK1IVZDiGYMHLiahu2xsuIh/U
 3DI2IReUquqm89P9Odt5TPwaUUvaZgZQw9SR7JT2tlxigjuo7wqQukrOuNUhSuAjo3HQN2KcW7G
 kwhdOMjXCKSWC/lWrRX4Q8CQoqwANhCZi4t6Ot5F/0W8z1N+z6kZOy5R8zkgIjW2SFpv/sRDr6c
 X087VQ2iQjK2O71V1/w==
X-Authority-Analysis: v=2.4 cv=RM+D2Yi+ c=1 sm=1 tr=0 ts=6a7af665 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8 a=TwdlpdOv2MY0_bTcK8AA:9
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: NF2vdYash2E46peuNqqoCyIE7NnCuNNC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_06,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 phishscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 clxscore=1015 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608110084

On Tue, Aug 11, 2026 at 10:58=E2=80=AFAM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
>
> Add a minimal Module Controller driver for the R-Car X5H (R8A78000) SoC.
> For now this just supports the always-on power domains, and dummy module
> clocks and resets for the serial console (which is enabled by the boot
> loader).
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Hi Geert,

I had a closer look at the attach part and there is few questions,
please see below.

> ---
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
>  drivers/pmdomain/renesas/r8a78000-mdlc.c | 330 +++++++++++++++++++++++
>  drivers/soc/renesas/Kconfig              |   1 +
>  4 files changed, 336 insertions(+)
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
> index 0000000000000000..5c8acead7cff9bdd
> --- /dev/null
> +++ b/drivers/pmdomain/renesas/r8a78000-mdlc.c
> @@ -0,0 +1,330 @@
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
> +       if (pd_spec.args_count !=3D 2) {
> +               of_node_put(pd_spec.np);
> +               return -EINVAL;
> +       }

Is the above check really needed?

Assuming r8a78000_genpd_xlate() is used for attaching, then the
args_count must always be 2, otherwise we return an error code when
trying to attach the device to its genpd, right?

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

Would it not be better (if possible) to do the above verification as a
part of the r8a78000_genpd_xlate() instead?

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

Kind regards
Uffe
