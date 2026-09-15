Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1F983EC816
	for <linux-renesas-soc@vger.kernel.org>; Tue, 15 Sep 2026 20:04:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789502654; cv=pass; b=MQYZ0FvxVxkZw4bRfnY0btQcO/hI+WsMCGp9zggOyLM3JlWZvItR+7No/57bvWk/JiSQUOIhlWtiHGzDfPiS5vKJEIPYPymXE3UsnEEtLTsjFRqT7WvPqFlzvSZyITPsNvpJnVFT4zXfafsHGTA07Kd9aO7+p9P535S548xnfNU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789502654; c=relaxed/simple;
	bh=67tAq1qJhAYCAKyoVSg1Qc+3onHjSmhgjfysUABNfB0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Nx52HN+06aA5zCUQBE6/P/7qLo8BMVD1EEmdAYSz552Qkpq/usLmalSfCd2Urh5GnFpTyZr5vL9WhzycA67VrDgNu9JgpaurkCpyussxnf0/MZuFwoio7k8zT49JmoE+te+QSv7l986n+IaPs455fDLBg46OD4aGLmUR49Xcus8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nJuatJKy; arc=pass smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nJuatJKy"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49b912e4b11so1129935e9.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 15 Sep 2026 13:04:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789502649; cv=none;
        d=google.com; s=arc-20260327;
        b=lmi5bwGFlFv17w2gt1zZuUL2+Y+H8Zk/jPgDKNB/Xh3D3FGzZk7OwX20jqClKgDWdM
         D5nYj6zf8kPhUC9jikqURhdRxvtZ5EJVFacglydxhVG+RRyNg4EUMWHrcWnA6L18TZ2b
         1J9Yr+jrwxuF03bAqII2HXxjH20VariBrKONskeaQykgYLsqqRywt9FG3KKhNdvaZpPK
         wG1UEErR+CKVzR6F98k8csMeJ0uvIPbSfkfnaGrNWfEuGdQflbR68ymYMf/Mv+Nk/67S
         Wn82fFIfPIYsCTfnY9hxAYOs8phY5d3fY/QAO2YBGktYR59ZHowLY3P3C2Pt5YtsUlW9
         PGCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VbWmhOGlJLhxr01yrGYucTT6Sp4rdowe8PfmPHelJMU=;
        fh=DNR4nFfhgBbwl49bhZC+z+vLijRa6Bpx6r/qncfFVDg=;
        b=P5ZVy48lpXq5EV9rzuyNQ2IpU/mZEX7XvOpOFF+00r8jwVTb1zTB07ADW/UunpBYKK
         9FK6SzDEZYaaNTBSw+IpjL9snr2pnz/PKB081+Dy0wklS1KyiQqP01Drub6Rg7qvN4JU
         1U8a7YX22fjmIDbFx8uPbVMNYaOCPIx1hqp1jZUzmh3Ovmu2w5jlWvcZnF2AmIdFUv7V
         BrzW9uOEQ9TqDZbDkFyjDFdpA0/rdu4KxBlZLbr9j68+3ZVMUBEvmrxJ9WKAESFYhpc0
         zEbdLhunH0f1lglig55uDGUgrK6869T6bKkFvRu4FRyjMRJ54Y2rHtP/pirym1kiVJTV
         gyOQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789502649; x=1790107449; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VbWmhOGlJLhxr01yrGYucTT6Sp4rdowe8PfmPHelJMU=;
        b=nJuatJKyLYsQ+Q+dYlM9q7v38jxcSKQ3AXVTq7p4t4H+1BAZwsLVfJjQUYaXIRueoy
         mdW3iK0EXcioFKKEGxpx7fo3c57yWDzGKGeHdw00u3RtckvWatA6stl7nqpmvcq0hFvV
         xeRMtnEAwsCdrfN3VhfcnhCY35jOq+tY1h2BWmvNd4p4UlYrpU/BMlCrsUS1nrRmunc3
         SCXvi2Y9KzkmIm+S9sq9etWjLXATTjVZQ7xTjOUmsOPpzhHWNkl4M9moc2O1HRtawZMX
         aAC7ebxYXgQt6heYplL/hPl+feIjZ4z/HtBEwMSwMeUrwFB8alSdKWTDHS2lnBn9M41z
         qlMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789502649; x=1790107449;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VbWmhOGlJLhxr01yrGYucTT6Sp4rdowe8PfmPHelJMU=;
        b=RfDxrKQSXXfEvjyhtvG30Pf/kzWu5w0PBB6kC5PaAeHJS1ARy3G6qPH+WAkGelltyz
         QoN/zmDSZVQ3b91cDk0EulE6fchuR6QJc9mTkdmaKvg330ALcYwVsANBr1XHs4H6ALy9
         GBkTwk/Xvg8Evyf6cYttmh2zJqRNhDvgzIKOa58Bk526e86UMss3H3pedFLGGFs69B7e
         v9MrsbzAbYguTJR6KvhdwSoot7Ef9VFQyYJ99EPAvDDCvj/cdMnTfFnd8Dw4ycfJ8daF
         P1djQvU+M6LxPRAZPtDMAV9nqM+OUu7aUXEXXsxnsmOkS3DuVXaC90oGfsvP6/0H+qZs
         9ErQ==
X-Forwarded-Encrypted: i=1; AKwUvBzPPOjzetuxQZtJC0BnerGIJHZjS01oybqcoCZ0Nli3SZ4egd5nMeInf+mxF3JGcuSv9LIB09aL2vGOZzRV7OS9Zg==@vger.kernel.org
X-Gm-Message-State: AFuF++kO9EoAOsCv+ZOijBjD7BsHGWWaOXUKXyUBq2DrA6T+cPzgf9qC
	TpkFIS6sp0gvjuYssn73CK7sFHOaIu/1w2bowGuXxxVP5QEuaQyZQHHsEHS/H4M281eAVvo0+MG
	Bx9o0k6/cruus9PrkpUi1aGWxrUB50+A=
X-Gm-Gg: AYBFou2tcB0hWUGIxlz1B9TLWxNNsGPUfoKd1X+gHYfzFLJgbh2ABYrAemGHWh/kATd
	n3UvQFkTPRHMn5HhNzv2+OKawZxl267uAJVnPeq6H0gVn6Aw0RK/VjZVeuUd9wV5hhT51n3EYA3
	lNPvT9t3jzeB2m4o92K3ad30jAnDmdhMDHWtTGQ67Q+WpuMW3Nv0bJE8AceOpZJyCSU3D9Sk3qu
	T4Gj9z2H2rpfs3EL+Y9hGV3HvR/Sz/JapTokeGG7sIlhnsTKsC8CjscQZUNdKpcCCFx6VzrjFb5
	J0u+prCKt0R8XxUOfWya3mPzFtUsp5GFWOYp1Ydi4hnFOLTi1Tfl5fRl7IIRaJZR1NopkpJCApd
	8NW52dLYc2D0AKnU75lii0kXjvhOP1J76sFcTwcopFjc=
X-Received: by 2002:a05:600c:8b23:b0:49d:1d6a:4cfb with SMTP id
 5b1f17b1804b1-49e8222d175mr32905135e9.1.1789502648344; Tue, 15 Sep 2026
 13:04:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260915-rzn1-miic-fix-array-v5-1-b7173fd5b97d@reliablecontrols.com>
In-Reply-To: <20260915-rzn1-miic-fix-array-v5-1-b7173fd5b97d@reliablecontrols.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 15 Sep 2026 21:03:40 +0100
X-Gm-Features: AcwNN1W_W8KYsdZp3NjvMcl83DNtuo32RgFL8XJ_q1dWoFykhtUqHGE8Zf0GyvY
Message-ID: <CA+V-a8sdrexKiRE_Mev=qRjRdbnx7GoPhsDGeAi0Gpmw5QbaHQ@mail.gmail.com>
Subject: Re: [PATCH net v5] net: pcs: rzn1-miic: Fix config array initialization
To: khendry@reliablecontrols.com
Cc: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>, 
	Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 15, 2026 at 6:54=E2=80=AFPM Kyle Hendry via B4 Relay
<devnull+khendry.reliablecontrols.com@kernel.org> wrote:
>
> From: Kyle Hendry <khendry@reliablecontrols.com>
>
> Fix memset parameters to initialize the entire DT value array
>
> Fixes: f39e968dc168a7bd ("net: pcs: rzn1-miic: Move configuration data to=
 SoC-specific struct")
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Kyle Hendry <khendry@reliablecontrols.com>
> ---
> Fix issues when populating dt_val array from device tree values
>
> Changes in v5:
>  * Target memset patch for net
>  * Drop port number validation patch for later submission to net-next
>
> Changes in v4: https://lore.kernel.org/r/20260914-rzn1-miic-fix-array-v4-=
0-069112feec86@reliablecontrols.com
>  * Fix lines longer than 80 char
>  * Add of_node_put() before returning
>
> Changes in v3: https://lore.kernel.org/r/20260902-rzn1-miic-fix-array-v3-=
0-3f7dccffaf5a@reliablecontrols.com
>  * Make invalid port number return error
>  * Update commit tags
>
> Changes in v2: https://lore.kernel.org/r/20260901-rzn1-miic-fix-array-v2-=
0-3e907049e770@reliablecontrols.com
>  * Use a more correct array size in memset
>  * Ensure that write to dt_val is in range
>
> Link to v1: https://lore.kernel.org/r/20260813-rzn1-miic-fix-array-v1-1-b=
58cafcc917e@reliablecontrols.com
> ---
>  drivers/net/pcs/pcs-rzn1-miic.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

> diff --git a/drivers/net/pcs/pcs-rzn1-miic.c b/drivers/net/pcs/pcs-rzn1-m=
iic.c
> index 2b72fa98ddf1..cb74861e823c 100644
> --- a/drivers/net/pcs/pcs-rzn1-miic.c
> +++ b/drivers/net/pcs/pcs-rzn1-miic.c
> @@ -683,7 +683,8 @@ static int miic_parse_dt(struct miic *miic, u32 *mode=
_cfg)
>         if (!dt_val)
>                 return -ENOMEM;
>
> -       memset(dt_val, MIIC_MODCTRL_CONF_NONE, sizeof(*dt_val));
> +       memset(dt_val, MIIC_MODCTRL_CONF_NONE,
> +              sizeof(*dt_val) * miic->of_data->conf_conv_count);
>
>         if (of_property_read_u32(np, "renesas,miic-switch-portin", &conf)=
 =3D=3D 0)
>                 dt_val[0] =3D conf;
>
> ---
> base-commit: 83a945a529d6e002dd7339c532288a931f463dba
> change-id: 20260813-rzn1-miic-fix-array-e6ae4452c017
>
> Best regards,
> --
> Kyle Hendry <khendry@reliablecontrols.com>
>
>
>
