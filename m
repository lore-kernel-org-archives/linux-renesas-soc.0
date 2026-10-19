Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15CCB4DDB25
	for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Oct 2026 14:21:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792419700; cv=none; b=Hk01t3bjKNCZMdWHSLQAIPa17vB4lyuQpdrb2G/q9QwJRtttY+JYtJlKXGpjtu+oDmGXhooGz7fWZxHoP0vSGOiWZZQZiuUp89w0D3Gg2sfPDWffua5foeW/zga7ABDOk1uhlwvJrB3mvMJqcF+iwg30wa8oqDO5A4FGM6XyD3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792419700; c=relaxed/simple;
	bh=SNGLc1dRo+r2RFwuwPeYSacsXpa5s/1i0LqchSr1mA0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WppQB5vZF0oGgwBt0mZWt3wDOGWI2z08BwYKk+sE8tsTxtQeoPzaV/+S50om+CbTgCKbHP0tcioQqDLNCI91IQQxb1gT9yMJKRTQYGyPOBxNW7xTuBhqfHJhqytBzmt0g9JkNr3DG0Y/sKXvw6oW/q3chX3+q12AsmWFrOLp97s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c263415982eso253702766b.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Oct 2026 07:21:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792419697; x=1793024497;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=r5Un3tcFd0CWzR3WfawxmOsdbODnCsUjJ4VgKeoks+s=;
        b=npGSUd0/jIapt4H5fgRuGMkYa1FK25lD7v7DaPiXLkWAgJJwSveHg6DEgraGL1vR9t
         +cQqm7+48pL3dqjA0DJU7FnoXN5TOyOzGkqFjYKjlr3nTSKW4MydlX9z8zDogo+CFZjN
         lMxLKkJJJ8JlvBYg+mLv78puI6JA+nu/VIykM9DGdcPQf95GCatlfTqf97fLvJadZUsX
         6TZnFfX89dirlvDXZTQj20fcqTLaDsFf18ebU7RR+PP8WRoDlHNf3IQHHmGcKYJPuy1P
         ri6nWcTeaM28lU9ZJYI8TK46MuvE0U9YCWlC4x2EzPPwGvLYjKm7KFRLqLNu1Vmd25s/
         /5Xw==
X-Forwarded-Encrypted: i=1; AKwUvBzalSLxSYshTb0BW0oA+nZ4DZOHgYbNuvAOb5iNvm3rq3UxJvjhk9BLGHm7gGYyXDrbgi6F+Wop8qP6m4uuC+fBJQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYLlIXYEh1nQm6DJ707OVMEpvEHp3docxEN6jIIhGGYfOukQ1fyH
	Zky+0kNzQ/ytW4rPwclpb0HWNcE+G1mKChGuEUlxDX5INcZIOAsdE3O3VScFO3eYk74=
X-Gm-Gg: AYBFou3YGannWtVKMv5JXYKfYZMZLV4RYW6QYkN2EFQ/AccVS/WcuuHCb3b9Oi8BzIA
	N+g1eZMw7KVG0wej9dWHOhrrPHV0tjepEqnxUMkh9W3DnvYpJSXaIWxcndPJ73TgKq40b2jhrUp
	nh9SPUFiSHdUMJ/1gVR7Zs7b1xR33oXGP50F4e/ZnyhOQu5zZJdvlO79i1Nt+Iy4jOfC5I5SM2H
	luUiVL/e6Tkjw6wQSio5NoedFHRtlvW3g42eDZdoPApYMbf8mJBhgryMYBkXIj4hYnH1cBk2YES
	CwchW3DPbt2BQDgxT2falCcqM0ByeL1TQYltOgWN/gxMcQ1fb9ahpvYzxyGl7apJnyC0eaVDXjB
	E0M6ZGustelqzfAfmVpUPd13WnR000mBxhrEOYEACAprvGW55+UJ0CykJeJ9Uqbxo8oQsC4lV86
	yRyLT4IL3p7iRIFcOHgMrbU8SQyvhPWHVMZ5vh0hqlR0OjnqD/N1UpR+ATpHQ1U4XdyKhi55BBa
	hu1yLnwtfx4PhBd2TPtjOVMWViFpErAn/Y/
X-Received: by 2002:a17:907:3e15:b0:c2e:808a:f78a with SMTP id a640c23a62f3a-c419f31b40emr577830466b.32.1792419697166;
        Mon, 19 Oct 2026 07:21:37 -0700 (PDT)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com. [209.85.218.51])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c40912ca7f2sm384778966b.46.2026.10.19.07.21.35
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 07:21:35 -0700 (PDT)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c411e139259so204155466b.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Oct 2026 07:21:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByVXSAYNby/SqswNFtfV5oyxvoU99zoL7TyXzEhpnv/n0VkOreyp6f5NaxuTCWxWlcP8txbsE0eYHO6YS2kNjUb4A==@vger.kernel.org
X-Received: by 2002:a17:907:720b:b0:c3f:153a:8663 with SMTP id
 a640c23a62f3a-c419e63930cmr576763166b.23.1792419694998; Mon, 19 Oct 2026
 07:21:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261013-paul-v7-3-rc1-edac-v6-0-2f1d6f2f74db@bootlin.com> <20261013-paul-v7-3-rc1-edac-v6-2-2f1d6f2f74db@bootlin.com>
In-Reply-To: <20261013-paul-v7-3-rc1-edac-v6-2-2f1d6f2f74db@bootlin.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 19 Oct 2026 16:21:21 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUkhM3OtWnckc-ou69ZYFMfRT+DmU5AgUctJ0uY9w_GDw@mail.gmail.com>
X-Gm-Features: AclHuK-siV4JYKFbtDQyYh3ROQEzSATnv4TCER_6U2XNGxIXypq0WsoD3L-uWls
Message-ID: <CAMuHMdUkhM3OtWnckc-ou69ZYFMfRT+DmU5AgUctJ0uY9w_GDw@mail.gmail.com>
Subject: Re: [PATCH v6 2/3] EDAC/cadence: Add Cadence DDR EDAC driver
To: Paul Louvel <paul.louvel@bootlin.com>
Cc: Borislav Petkov <bp@alien8.de>, Tony Luck <tony.luck@intel.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-edac@vger.kernel.org, devicetree@vger.kernel.org, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Herve Codina <herve.codina@bootlin.com>
Content-Type: text/plain; charset="UTF-8"

Hi Paul,

On Tue, 13 Oct 2026 at 12:45, Paul Louvel <paul.louvel@bootlin.com> wrote:
> Add the Cadence EDAC driver found on Renesas RZ/N1x SoC.
> The memory controller supports ECC, software scrubbing, and SECDED.
>
> Signed-off-by: Paul Louvel (Schneider Electric) <paul.louvel@bootlin.com>

Thanks for the update!

> --- /dev/null
> +++ b/drivers/edac/cadence_edac.c

> +static const struct of_device_id cdns_ddr_ctrl_of_match[] = { { .compatible = "cdns,ddr-edac" },
> +                                                             {} };

Why this weird formatting?

> +MODULE_DEVICE_TABLE(of, cdns_ddr_ctrl_of_match);

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
