Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE2533603F6
	for <linux-renesas-soc@vger.kernel.org>; Wed,  5 Aug 2026 07:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785916424; cv=none; b=nOrkHlbEeuPm3WhipQEbUIWKlMYMU6YNB9tfJfJp1pnqgmtdbH7vEu/dCYwBbztbB30qWssTIl4piUL1g9DKkeyADHpwtFNl7ZnFTuRi0QJ8a7WMGHPHuescxPUrDV3PZCX/nBJ/o+nPDfKuU9pXREm8IhmA2149H5+upppfAM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785916424; c=relaxed/simple;
	bh=uwbTheRxj+yCut56Z2OBUgfjWKw49pVIDvBDA7a9KSE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fjjIE3YHoppXe/sWnR7nWfJhtBIx1V8tBn5Bc+5BadElEfz40yltfemImHytnh7Yazo+YYHwXfS0aAwhYXyBeAISBpkA3y0S/9smTZnYPmaChyyYrARk5utFmTVtf6Ee2w6YEpyBftKPaaMeEHHH6aF1tNXywmLPt8lwEq/hI/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-5c38568d9e1so220794e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 05 Aug 2026 00:53:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785916422; x=1786521222;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0Jr0GgueyARZ20CCzQ9FDczXEeTxE2eTPx3t7jOdiD4=;
        b=U4Tai4B2Pln1LQ1kvDgE1G55K95vc3lmxopKXIPG5tPN9bGOYd5u7azP5D4K4+kFpS
         ir+Y2ozfENcwkywqm36cgkX4/+nDFxd4t5BSC4997G3398D5ghp0eyDr9K7MTT973B+M
         UCBhQzE/wOEgg3jPQJIo8AlAB9bzB+TI8sGc17/qEQLhrExS601PZrYELaJAsgzjQWPt
         pg9Es5ww40JlM6MPwMnWgmFbUSJtaClyh35PEGltAtb+bmMm1S5/yemKK+sx3E3ccsp3
         gUJRiXifxtZcrvgzTVqYbxEwlPAp2m0lrYpzlzjUM9TqAIirgj4EVaigCz+cAdNpm5hC
         0ODQ==
X-Forwarded-Encrypted: i=1; AHgh+Rrb6UVYQSGZinx3lDRqvgEK6UpntVQF1ewBIZRBsG/2WhQslIM1lYFl8VnRQ5R/vy5OhzD9cqOmOkF9anIT0hJOLQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwzKwczIqE/GjiP2RGySgFKWILmhp6Y54GbM1+0qj2MQ5cHy+cH
	VlnlvXyfpJBggKH5UToq3/2X54oFV0911etRPeW6gX9rXhKlrfEDELqOeRYgv78C
X-Gm-Gg: AR+sD13YmSnvUPIvMx7CExm7L7ZpF+/LufIp2LuiWQlod4MbNmbyfmmnR+F8eFmzch1
	PIb0n33HHf1TmlCOwIys5JxhEFkfB3qSKFEoG5TDk40OGlsUyUNxUk3eslMI/OoYRDe0iV0dNAb
	87prE+zDkLtKa1HgIMSGTyhMfiJD31l/xCGcE8CQhC2tTRaPirTQiXFzeNMti6JGfDYmDu578s4
	7qrd6f7l/I4b/0ubNbaz1P0LiCrDBQtL/MkvpUrFWT97XhyimCw3qC549ryAHc8AKtRM8APs+7j
	CUc5uTXUSstfb8irUARefc7lgzzWP53FF/bx0Jvbzy2rBvJf8Ll6MEMo5gbiuHkw0fMBiY0dgIJ
	DUOZ5PmI1wOTDk6OJ2+zpYPX0gxdPkEPS88dXdesy6836hqo6XbMw7Yo9JATAFUHBJilv11j577
	D3y/J6fESIsloC+RZAs9eEA38B04h9eCneafjMEbWf036B1YVkwWcjcPNxQ0aqkyhDto4lbPrrE
	4w6+xN7ggdfQMT3YJF/5edIn4tRLSwL7fcE
X-Received: by 2002:a05:6122:1d45:b0:5bf:9f77:477a with SMTP id 71dfb90a1353d-5c3d9087aefmr541392e0c.2.1785916421753;
        Wed, 05 Aug 2026 00:53:41 -0700 (PDT)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com. [209.85.222.54])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c3d050bd1csm1398534e0c.4.2026.08.05.00.53.40
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Aug 2026 00:53:40 -0700 (PDT)
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-97017a60b06so204393241.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 05 Aug 2026 00:53:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqvJ6lMx3mjStqSNuvS4XmYKOQT1nihgHEsJhnxT0diKcXwGd40JM9AZKQl4zNTufP0WQadSGaOGjUnsMRUL2YzlA==@vger.kernel.org
X-Received: by 2002:a05:6102:4bc2:b0:738:84c:6b3 with SMTP id
 ada2fe7eead31-760e6ed510fmr1096569137.3.1785916420540; Wed, 05 Aug 2026
 00:53:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260728011656.465040-1-marek.vasut+renesas@mailbox.org>
 <20260728011656.465040-2-marek.vasut+renesas@mailbox.org> <anJ6HkPgDb7I4xeL@vbox>
In-Reply-To: <anJ6HkPgDb7I4xeL@vbox>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 5 Aug 2026 09:53:29 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVQRJv8zoQYmgiObivaOoOBnE53mVdF3hPsJBK4bu4-Ew@mail.gmail.com>
X-Gm-Features: AUfX_mxP7XFNZTbkOdgjKR201hDCIQfWC5qVjcrN0qm75x-GUJxSc7cxG09TMSI
Message-ID: <CAMuHMdVQRJv8zoQYmgiObivaOoOBnE53mVdF3hPsJBK4bu4-Ew@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] usb: dwc3: Add Renesas R-Car Gen5 DWC3 xHCI USB
 controller glue
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, Thanh Quan <thanh.quan.xn@renesas.com>, 
	Conor Dooley <conor+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Thinh,

On Wed, 5 Aug 2026 at 02:48, Thinh Nguyen <Thinh.Nguyen@synopsys.com> wrote:
> On Tue, Jul 28, 2026, Marek Vasut wrote:
> > --- /dev/null
> > +++ b/drivers/usb/dwc3/dwc3-rcar-gen5.c

> > +static int __maybe_unused dwc3_rcar_gen5_suspend(struct device *dev)
>
> Avoid using __maybe_unused. If it's not used, remove it.

Whether the function is used or not depends on CONFIG_PM_SLEEP ;-)

> > +static DEFINE_RUNTIME_DEV_PM_OPS(dwc3_rcar_gen5_pm_ops,
> > +                              dwc3_rcar_gen5_suspend,
> > +                              dwc3_rcar_gen5_resume, NULL);

As DEFINE_RUNTIME_DEV_PM_OPS() uses pm_sleep_ptr()
internally, the __maybe_unused annotations above can be removed.

> > +
> > +static const struct of_device_id dwc3_rcar_gen5_of_match[] = {
> > +     { .compatible = "renesas,rcar-gen5-usb" },
> > +     { /* sentinel */ }
> > +};
> > +MODULE_DEVICE_TABLE(of, dwc3_rcar_gen5_of_match);
> > +
> > +static struct platform_driver dwc3_rcar_gen5_driver = {
> > +     .probe          = dwc3_rcar_gen5_probe,
> > +     .driver         = {
> > +             .name   = "renesas-rcar-gen5-usb",
> > +             .of_match_table = dwc3_rcar_gen5_of_match,
> > +             .pm     = &dwc3_rcar_gen5_pm_ops,

But as Sashiko pointed out, the pm_ptr() is missing here.

> > +     },
> > +};
> > +
> > +module_platform_driver(dwc3_rcar_gen5_driver);


Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
