Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90F534A2071
	for <linux-renesas-soc@vger.kernel.org>; Tue,  6 Oct 2026 18:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791311620; cv=pass; b=DNdgfOqEx5iKqlHtEOmeDvF+Qx5mynW6+gdV3Fv+6ESqoaOWr9ASZ7dwYKZhpEVpBsT3iAwvKMVbQAt/QYb886+cBrVYPs6GH9OeqyJHYQdNRMyopwjWwGMW3nRdoMKpjVFsovdHezQTEPFvLJRVezK7WY7dFQ47YE9s5omsljk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791311620; c=relaxed/simple;
	bh=97oUKsO0e5chpZ77/TXNGzc+ViH4yet7xP4s2/riIOU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iniWez4Ay9r2yCtnx9t97g+FhmYFE0nNmeVo4gUlCJB/2Yz4R+945Lzlun9Y+WBm9V0QYtKSWZtL5nH9dzIC3YQ1+A+kXSIrt6LKkNCZmYNPBE7J+4zPZXAkHGvOI4LE2FwPEVAMlJ4gZx5fr8wdYIX1zx6ECzE7lwFK5Izjaj8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gYNyzuGb; arc=pass smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gYNyzuGb"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48afe75f055so2847489f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 06 Oct 2026 11:33:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791311617; cv=none;
        d=google.com; s=arc-20260327;
        b=InVc9M2qa9vjYhRqorlXWa7JiN4JqvD+talHSoEvMiPXDdmpYG/kGpDPDy6BsSxFsI
         TiKt43V9VOqFXQFOrHr5M6ovTYQgrrD+PW77n8rrVw9PY5Z5zMwlY7+2WANJJHDqijKs
         tF7iFaRIeHpUwxF2bEqkMIOiUC+DpoXwBSSnvZlVlN+iUGwkffT2YbuafAuk6CJF9Szg
         nM9PcPLg5atKN9+yb6ay0JpBHucz8bhqrLwgQ+PEP0xDPMMQPN/9ivKHFTCE7QPXMFZs
         8qGUoCRPZF5cAW+i1LHrgbpLL6XfnkUDRfG2TB4Kvy6wV580X4nddkiX6TkWOz607il9
         T10w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1I/Bjkthev9xcVUp93lwFAJuDTou6l7HQTsHKxmqsYg=;
        fh=4bUPKfPDSX+e9i1MdLt5ciEMlEHQ+JXjfPFpI5a/OLo=;
        b=cljtUW+wEXV/1Ogftl5p5F6v4maffWbfLOa7hZ/btYwp66Kyj674MrzIbChSLIDiF6
         bHQKPgkscCgfA3lewFPJSSCK6B/cy8MBDgELTaZpZXJ07hpbTlr5gUG3wPa0RLis6Crb
         fNz519tcDc0eb+JjKAXBsCF9CpoElcBSYI6mE5lys94cQUS3amshpluoSLFh+NsXTUay
         +EAKTLVNP5G3p+o+bg/LY3F3n10yOkXCYHVcWZzi2rf5pAKZ290icFlEs3EW4FE78UYN
         5Y7V/tStVDH9GkV6ZU077UELTq+Grdxd79diN8Dhwk5s1SQUS6Efdy3GtqjUhqj/JArU
         okkQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791311617; x=1791916417; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1I/Bjkthev9xcVUp93lwFAJuDTou6l7HQTsHKxmqsYg=;
        b=gYNyzuGbEw8W4W3thlPUfhzcRnGusY6lf3EsyUAc/nJ8UnMCTdXApXgRl1ks+flh/R
         3nuifYo9GCF1zUtCvxZZbn/ndZY3BmFFEmzp5x/9O8pnunYO/T/DkyC4GO/qbjrUMm6u
         c1eZRWsydrqSm70+EmlkERII7S02TvFh5QEX7fuNcvIGNeFtjruIG7pr9d4WWeP2NVTM
         iyZp5F/3YskowHayAhhd0xicqdv6zQxv6HMYk4qVL0bi6lPgR31v8xShbf0XMpTkdH6y
         BC/4NEb76i122EwS/3DyjXwI3ghwDzL27WXpirH3bOjllOCnjF5lNPqAI0qhKmyxJj8W
         M3Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791311617; x=1791916417;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1I/Bjkthev9xcVUp93lwFAJuDTou6l7HQTsHKxmqsYg=;
        b=1C4vVdLr2BuPpbTY5ihgXCOcKZqs7zUzAeX+3UvotmX8u4i2KUflsXHFyE/QJY5JpI
         /oCQy9eJTsS8z+N3A5/4gNTNt4amrvLC+JozKlTKHHdd3/5jxJdPsnTS/tJbh/MeL7u5
         cZtz+4pVsnp9xsOiy+M5lfOrVAHsQaih2guQzhPELbxpTdeI8bS0X7aDTC4QO4zHewD3
         C2ZEqqEdiqrO0L2IuVN8VifIXrU1iJd86hOB8v0C33z6zHh0WTpPPhOFgqrjb5EQdzpD
         FvgoRg9nEUtYBLtNajexNh5zJxMY8VhbcDuyFXvGfLtLpLfeM8DwYG0SQ4HMBFZObCzr
         QGWw==
X-Forwarded-Encrypted: i=1; AKwUvBziHDhbg3IS2JvOvejiU+bqk4XAtcc1bkIaGdHLjJmcyblUEyPLOAvId/2DlSZh7fDVZwlg50YmkPb0YEMeM3MlZg==@vger.kernel.org
X-Gm-Message-State: AFq9FYKCfi/KzDXVL99jvAqozRNJH3iEXaHMq6+HPMI3F/sWV4ddorDr
	rxSOrBy4UEf7MTUkzTryEkLjQ4J3VtLmBFvOP8eMYnyt29E6gvg4qH+L1h3J78pQ0dsNWk7LHC5
	wemRFv7R7LoujcGuZTNmrVLdIlnx88dQ=
X-Gm-Gg: AYBFou1D+y2eclBaNGOgcjnqDwDQ6bCIJ5zk/eV2pWPsKfILJbICG05Yvm16i4HmKbl
	EzI5Ng1To3W2P4bf63u3kHdJCYO4zxDRf2HlPo6aBf8S8Itwtj2/TOU9MfMjr/QV5/V18VFZuVQ
	zzAhBRuYp9QosGDacnePPtmTuGn9NAtrBv+6VO1SH3YapKCj5NwCvmFYjKyff5HBGy7MUVxeY0T
	NPQAqnWV6U6ejNEaN2xgHTTmaLYIj+eiyaHPbmCAM4xOVmxWgN34yIH+0l6jff4OheJbWc59xY+
	Gi3KjA/IS4ggMYwSTdU0hBipbm0ZzUtX8aUKdaX6/igdWlXWZhGwK8zEJi2m82hQy3AhdwwCgj8
	yaplNMFoHDvxky3/MKt55vc3HGZz3UfFBaD46LBmXLNk=
X-Received: by 2002:a05:6000:208a:b0:487:1ac0:32af with SMTP id
 ffacd0b85a97d-48c728a7f51mr452023f8f.51.1791311616531; Tue, 06 Oct 2026
 11:33:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260928-mali-c55-renesas-dts-v3-0-2cf7eb746ebb@kernel.org> <20260928-mali-c55-renesas-dts-v3-5-2cf7eb746ebb@kernel.org>
In-Reply-To: <20260928-mali-c55-renesas-dts-v3-5-2cf7eb746ebb@kernel.org>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 6 Oct 2026 19:33:09 +0100
X-Gm-Features: AclHuK-lHOnsjkuXOpvnCyKRYV7OYbDYDNgNdkGPQxNTBgQh6bjjlMS_ndycwy4
Message-ID: <CA+V-a8uam6zpuFoJURO+YuiYLeckAYvEAOpF5cZsH2buBsfLBg@mail.gmail.com>
Subject: Re: [PATCH v3 5/5] arm64: dts: renesas: r9a09g057h44-rzv2h-evk: Add
 ISP and IVC nodes
To: Linus Walleij <linusw@kernel.org>
Cc: Daniel Scally <dan.scally@ideasonboard.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Linus,

On Mon, Sep 28, 2026 at 1:33=E2=80=AFPM Linus Walleij <linusw@kernel.org> w=
rote:
>
> From: Daniel Scally <dan.scally@ideasonboard.com>
>
> Add nodes to devicetree enabling the ISP and IVC that are found on
> the RZ/V2H(P) SoC.
>
> [Rebase onto v7.3-rc1 and sort the board overrides by label.
>  - Linus Walleij]
>
> Assisted-by: LLM
> Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Linus Walleij <linusw@kernel.org>
> ---
>  arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts b/arc=
h/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts
> index 637fc92dcc26..74b75be599ae 100644
> --- a/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts
> +++ b/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts
> @@ -305,6 +305,14 @@ versa3: clock-generator@69 {
>         };
>  };
>
> +&isp {
> +       status =3D "okay";
> +};
> +
> +&ivc {
> +       status =3D "okay";
> +};
> +
I was trying this on 20261006 as soon as I start camshark I get the
output below. Im using IMX708 sensor on the RZ/V2H EVK. Are there any
additional patches required for this to work (any sepcific version of
v4l-utils/libcamera) ?

192 login: [  196.846011] rcu: INFO: rcu_preempt detected stalls on CPUs/ta=
sks:
[  196.852193] rcu:     3-...0: (8 ticks this GP)
idle=3D2de4/1/0x4000000000000000 softirq=3D3984/3985 fqs=3D1048
[  196.861489] rcu:     (detected by 2, t=3D5253 jiffies, g=3D5753, q=3D6 n=
cpus=3D4)
[  206.875392] rcu: rcu_preempt kthread timer wakeup didn't happen for
1254 jiffies! g5753 f0x0 RCU_GP_WAIT_FQS(5) ->state=3DI
[  206.886411] rcu:     Possible timer handling issue on cpu=3D2
timer-softirq=3D2740
[  206.893406] rcu: rcu_preempt kthread starved for 1255 jiffies!
g5753 f0x0 RCU_GP_WAIT_FQS(5) ->state=3DI ->cpu=3D2
[  206.903455] rcu:     Unless rcu_preempt kthread gets sufficient CPU
time, OOM is now expected behavior.
[  206.912616] rcu: RCU grace-period kthread stack dump:
[  206.918235] rcu: Stack dump where RCU GP kthread last ran:
[  178.982667] rcu: INFO: rcu_preempt detected stalls on CPUs/tasks:
[  178.988821] rcu:     3-...0: (8 ticks this GP)
idle=3D2de4/1/0x4000000000000000 softirq=3D3984/3985 fqs=3D3946
[  178.998117] rcu:     (detected by 2, t=3D22262 jiffies, g=3D5753, q=3D6 =
ncpus=3D4)
[  199.056986] rcu: INFO: rcu_preempt detected stalls on CPUs/tasks:
[  199.063092] rcu:     3-...0: (8 ticks this GP)
idle=3D2de4/1/0x4000000000000000 softirq=3D3984/3985 fqs=3D6596
[  199.072322] rcu:     (detected by 2, t=3D38018 jiffies, g=3D5753, q=3D69=
 ncpus=3D4)
[  176.177639] rcu: INFO: rcu_preempt detected stalls on CPUs/tasks:
[  176.183749] rcu:     3-...0: (8 ticks this GP)
idle=3D2de4/1/0x4000000000000000 softirq=3D3984/3985 fqs=3D9246
[  176.192984] rcu:     (detected by 2, t=3D53773 jiffies, g=3D5753, q=3D70=
 ncpus=3D4)


Cheers,
Prabhakar

>  &mdio0 {
>         phy0: ethernet-phy@0 {
>                 compatible =3D "ethernet-phy-id0022.1640";
>
> --
> 2.55.0
>
>
