Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41F2E3DBD59
	for <linux-renesas-soc@vger.kernel.org>; Tue, 14 Apr 2026 13:12:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776172360; cv=none; b=U/NcW06dbZyRfnTrhd4eCOo5sgB/T0767aRjD0v5GYzfAAMCL3h4PyLd7f6Rr/O8Fw+VlP+z4Zmh8CC1rL5GmptjAYWra5GyN3G8BSvmNX0DgFF/1gXB41GKVnwYTDTy7zxgRjBoe5Q5T1Aogheas/ol8q3cryaVJcUEEDu45ms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776172360; c=relaxed/simple;
	bh=fS8zJr94oxWcqsByLfYI69JECmGzWhKtK7dvLqH02zw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CeHb2Zd9k0a/WEC4BFCKEqcbSMa+ky0nbl3A0+kGldVapuC5NcTMZ8mGFRdfpv/U8uuRHU5T0GUtbJgmabgoNq9gd/FPwK0L4THnQ16kLhszwR5qumbmGx8bL/uOevJXRJdrKwNnrH50EnGRa4Bb6o/IT0lkk2HMVhza20Raxqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-953ac1602f8so3212569241.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 14 Apr 2026 06:12:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776172358; x=1776777158;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1Z39CEUxNE/zBr+6BQR6piBSXx/BD8B2b6sRTgoYN/8=;
        b=b4JxZ9SVV3sw06/F4+03Yf+ttoS4u9gC28+TFoniJbMK92vAtMsZMzM3/22bhmIpEl
         8VL6tHSw78fYkc81G4lMsNMSdO2AfO0OZny11WBbVdEqWxBQz0iCbl+NwPaHdGw0Ce81
         3T60r3T6NGtozTJcqY12mtjnD1d3tUdEbZjT04Cc0/X9spdx9D6oc7FTX6rIxW4rvTLQ
         PtOgdXhMHh2s+Xax1yaEwNi82X77AXlTE4dExxgVOXDE6zEaUhEugVUOZCvF9NMhuIl9
         37VZqXWMCq+E3DKEUpDvDwmM6iSp9JXwR6bPPkQHt09ubhu7Ek756FiR/mRhnLzZpbUF
         EvtQ==
X-Gm-Message-State: AOJu0YyJEC2fSg6/6aZ7eeHwKo1AZuT44kF88FhN1kLdXgXyQAN8XjV6
	bUY3VJoZxiFJ/zg/rpHdOgMXCUmop5pZhiCL42fanZrKWYYAQkUrZAgX8Oq97SHZ
X-Gm-Gg: AeBDietrpSFuoOIO8FbSccSNvnA47dyRH0mrl2slFVqTJwHketRUlA8gA7rOTXrUsDo
	GYZEupxq7/Nkwp9/ByF0YN1PFedKNolyeAdh0Y7y+ur2mWvF8w0QGGHcLwE8KyL5CSmspP9Xuvy
	M4luYZ2hDaBtBDOS/O3kPsWBPl3RVK1disXHEajaXY26dvJQIMrj/sSrjDapGPxNJIs0v5JK/Mj
	fMTV49voWtEJ8SelUi8ltDzjsaNuLy9uoIhr4liUeN1rc0Oe/NerXaUaTxSSqzJUrCAhyx+miYC
	uKX1Cpd3MLEFLQvMtuH2yYHcJpdT2vodPBN4LRRx3zu7NAjRJRn7QcYkzof6XqRyitVRuk6FWPM
	psUXSON3IpV2y3N3u9f7ADIt42yq0+gcEBNvN7wlFVe0LSUCuVNq624YoGFdnpJkJyljONhBDpW
	4VeveMMQp9iZ1lgHfBaWGR7sxWhfYc1Q677Z4mewo1of6zfBqgSHu8aN/c+JLeVcEJ
X-Received: by 2002:a05:6102:a4a:b0:611:aecd:34d9 with SMTP id ada2fe7eead31-611aecd3efamr404199137.9.1776172358030;
        Tue, 14 Apr 2026 06:12:38 -0700 (PDT)
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com. [209.85.221.182])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-609db3ed0e3sm7768286137.9.2026.04.14.06.12.37
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Apr 2026 06:12:37 -0700 (PDT)
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-56d8a5f0e44so4986314e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 14 Apr 2026 06:12:37 -0700 (PDT)
X-Received: by 2002:a05:6122:6301:b0:56b:9534:c06f with SMTP id
 71dfb90a1353d-56f2906fedfmr6387662e0c.3.1776172357560; Tue, 14 Apr 2026
 06:12:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260413120139.36287-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20260413120139.36287-2-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 14 Apr 2026 15:12:25 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXr2cM0KZhvOqueMZ+wQ6FqEeoPGvdOLG4g+AzWirpcGg@mail.gmail.com>
X-Gm-Features: AQROBzAUQgEYOisNdLNs91kUsleXJbPooXGXo9klKaclhqsqWfgF_KoDiGKeWKU
Message-ID: <CAMuHMdXr2cM0KZhvOqueMZ+wQ6FqEeoPGvdOLG4g+AzWirpcGg@mail.gmail.com>
Subject: Re: [PATCH v3] mailbox: add list of used channels to debugfs
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Sudeep Holla <sudeep.holla@kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Hi Wolfram,

On Mon, 13 Apr 2026 at 14:09, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> During development, it is useful to see which mailboxes are currently
> obtained. Use a seq-file in debugfs to list the currently registered
> controllers and their used channels. Example output from a Renesas R-Car
> X5H based system:
>
> 189e0000.system-controller:
>    0: c1000000.mailbox_test_send_to_recv
>    1: c1000100.mailbox_test_recv_to_send
>  128: c1000100.mailbox_test_recv_to_send
>  129: c1000000.mailbox_test_send_to_recv
> 189e1000.system-controller:
>    4: scmi_dev.1
>    5: scmi_dev.2
>
> Note that mailbox controllers currently can be instantiated at any
> initcall stage. So, per-controller debugfs handling was discarded
> because it is not clear when to create the root "mailbox"-debugfs entry.
> A central file was chosen, similar to the GPIO subsystem, which is
> independent of the initcall stage because it will be accessed only when
> userspace is available anyhow.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Thanks for your patch, which looks useful!

> --- a/drivers/mailbox/mailbox.c
> +++ b/drivers/mailbox/mailbox.c

> +static int __init mbox_init(void)
> +{
> +       debugfs_create_file("mailbox_summary", 0444, NULL, NULL, &mbox_fops);

Can you please put it in a subdir, like all other summaries:

    ~ # ls  /sys/kernel/debug/*/*summary
    /sys/kernel/debug/clk/clk_orphan_summary
    /sys/kernel/debug/clk/clk_summary
    /sys/kernel/debug/devfreq/devfreq_summary
    /sys/kernel/debug/dmaengine/summary
    /sys/kernel/debug/pm_genpd/pm_genpd_summary
    /sys/kernel/debug/regulator/regulator_summary

? More mailbox-related files might be added later.
(But more importantly, that way my summary grabbing script will save
 it automatically ;-)

> +       return 0;
> +}
> +subsys_initcall(mbox_init);
> +#endif /* DEBUG_FS */

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
