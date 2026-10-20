Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792485965;
	b=EIX3B05dHNrdASU/npslrz7b/+8Xo3FHFxybJQHKjnH6dci0TLmjFMUsCd6mWctH3+cq
	 LZUbUty25+6AFwAe9FYCUvUElxQk/m9s1JINv2WktiuHX9mdgxXlHUNC4LDlvVTm8Ncr1
	 sRjJ2Kgmqo4OWmvlbN1Ye0HnnGs3kgoXacO3OZeE8dCKIzbrEfULLFB4AYPgF7chNjbOp
	 r9NsNbDz8QVd1QO4T0NyWPhVGVLD+KYa+Z+iQDt2VI7FtVyvi4yGDV8ZR8YNCXwdkRMPy
	 l7NHxBj1LnNqEAoLcMSQaOtK05/w7NxkrWmuiseK7XIMxa7rbDXdRlFj2PzqfSdB3vA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792485965;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=dPaUlNkCPLziA90hnNp1lAWN/FLqY45sp3q9cJ5rzKc=;
	b=wieNxurapzrTCAvd6xS7UfpZXALSa2KRFbqv0IA18UvWWuUv+rubFgwdbASusznMPr/H
	 oSI0I6lRIebm59/SaDlLG07R6unqEozRmRFh/aNvHFA+iUVRMiJQOjyF+iuMJR9wZKa46
	 d9kepMptKtVL+mTF3O02ACiySL845HHpTeuKYuG4vGj9DbaeYCdZjsKqdPPgSG7fXyvYF
	 R+4HFeMxr7Rl/wZgRKchaQXeFPJnJHSOQsOmKxnWYfaCg8ERMBbC2I5iwNywulYUgJr1K
	 iHRDWjpPFjH+FhxNk+Evq2UYVjVDn/4hIMEv5GGMe5JO15NpjWUnjXnmUGRTG+IgnHg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=EOxh4Z9f;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54ACA606A33C
	for <linux-renesas-soc@vger.kernel.org>; Tue, 20 Oct 2026 08:46:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 54ACA606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=EOxh4Z9f
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48b060ec084so2047447f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 20 Oct 2026 01:46:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792485964; cv=none;
        d=google.com; s=arc-20260327;
        b=QcjUyXWdeHQ1ZaWPqVst7FBddAm3GomHgW490c8S4NcA1kH+dZ57PhY/CeSBuwsbMt
         Dugp1ZzSXg+5Gt9cJ5FRLRPZUCvP1UcV0Y4eloTAjwNf7nFx9W3NxXVin/X0bA6hvWJy
         yZNRO3l1B4O0SMhjznFrWXPToKJ0klAOht9MkkUH6o04s42LJglivOOEPgt9c0uWs03g
         l7TYZxRoloiIx4zIkhK1CGDk+ol7aiADprvrOZRw/Bo/r7D3FbVuzPHQukzwDcnjqQMG
         pvnD3o12qcEhaDu6CWnBim9T7h0La38/lii9w2sRjWacYim6bfw0RsSK53SojfivV02j
         RT1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dPaUlNkCPLziA90hnNp1lAWN/FLqY45sp3q9cJ5rzKc=;
        fh=UJHqRpkEKl8NgMUweYnmC0hdZ0gT+5QC76PZlQDdSA0=;
        b=qJ5Ui2wHp4EuiciTObdi56uHBoDFG9/1JyNScy5apNZbJZkn86frl/0p/qib0PBcje
         ragNAQF9PScQV7Y3zPW07q7glw4YfT7LKVnLSTAp1CV6EdYElyZFpes6WXCV1sktKQms
         YkJAGOkyqQURY+/QWDu/fICcoA8TuWQbKSQ20PEQvDpS+u4Aok/YHkjofm9Spxw48i9f
         Z8pbhi46sdrblxYbj8agiSyF36pl+1qEWEDu4j9QZYJ0LEnn7E0rnQ51Fdm3mJDwhPiO
         q4tiSX3ntgvVJfjaK83X2ZPI7KK5QWfJJyQoUW/F/yfka9y5/mPgIafker5ps3wKCw+O
         I+Iw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792485964; x=1793090764; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dPaUlNkCPLziA90hnNp1lAWN/FLqY45sp3q9cJ5rzKc=;
        b=EOxh4Z9fRoRRWu9Bm9Z1tMLnFfM66s4Xo5FSgm6P97Ssxb2g2lliXffr40zTofIYnQ
         s9EDK4fYMTvAII44PVeoCGqdpxWOewXUdkwzhK0Scw78OW9ZRumBAGz7QGGl8Xi7A+gS
         7KEYnrbwreEkmc3lqEdsw+l3qs/LoVavXszWMkVq+aOr/fYv5yyJVehmXvT4cCDcB5vW
         V8/VvC1+G+WH9tZQV/G0bNtq+/gWXbAOf15ey+qK8wsBCsdUvaZjVipaPkI4m70fTwlX
         HoR798GKWTlqfKktrtQpdgwmrE/1Cfo7Kz5sQnKx20YzGWxuwB1j5FX+It3tmWUr8jfB
         oASg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792485964; x=1793090764;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dPaUlNkCPLziA90hnNp1lAWN/FLqY45sp3q9cJ5rzKc=;
        b=kgLKUZN+98N14ZDaP62iD3rBFf/+QSmNJwn5tI9UQdwgalU6b6lwb+MYcU87Z8hhdu
         ANxUS/X6/zkKmNiCp7AJcWZyH6SusrlhbPcmiJlACDzZEXkZmgrzSXt5AKUBiXR1JP50
         wxnZLl1WL3pVbmU3EMjoFBO9ES4WX28/SR2oY4Lm3UU/Ih/27n5zhFalD/nAiJtjR+5k
         F5FJVPgb8Xvl0TNP0bHNJ2+t89KBFa9vnD9LIU1+HEXWL02ux2bHjKrCEl/LfCdNSBHP
         VKY/NKM01qNBzTpZa2McqBpYWgjZpgg66SKFcSN3VvlfKdSQpNtg4qt9QD69Af34vRBn
         iSkg==
X-Forwarded-Encrypted: i=1; AKwUvByUEXMa6cJ+zEVsfLWOVebqzj82Pouebw7s3jJWeAaPvo7A00Tdg/X0qlrOTL5jPhYJMHCSU2dYa6ZahwLDIr2TNA==@vger.kernel.org
X-Gm-Message-State: AFq9FYLGLntSB7Z2+IC+/a5HLSHUICb423cjRUey5ZalmJWD2LvreEML
	dDGZm2WlKvINYoGjWQHZUHimz1sDIgYxYtoZufzcGtpBQrCnW2bVLqpfZtCecu5cxXJh3qScgmc
	+ZLj6CNOKZPHrT+eKy6TOpk9m2h2hW9PT9En2BYs=
X-Gm-Gg: AYBFou2NAh0lQ3iKdS/0XSBmCLp6Tqh+w15S13K/gYiax72pjIX2E49u8kuiISTJm99
	qYW8MjDSs5TpdCJ+uS65/JJixQt52pEJPMr/ltTUtPkU67YfQZU6M9ewBnoIGJLiCCDsvx9hTup
	j73MFrL+FIuq8N+MTOeiIN8aw9pD5lAXC1RL5W/fM/AUDKUVY0+EDF6ycuVgYzuVXBjCO493RK2
	8LJw80gEaRWXyIUcpwTvQaAJDheYt+A7IBqaNBLRBihXd6ELXOmPoSridM0tEl6TynV2cXpz7bV
	BYqHS0tv5su2KNiahclpKfAmuNGZ7XEpKLm8BkY7lykrF7OfjCVtHZvJs+r3PfFWuQXC/x5kaHP
	+40d3aPkH/KBhzQUL9yPZADg8YplSURVpVUE7rw==
X-Received: by 2002:a5d:5d09:0:b0:482:fd9c:3740 with SMTP id
 ffacd0b85a97d-48e07f98e2dmr24424365f8f.22.1792485963500; Tue, 20 Oct 2026
 01:46:03 -0700 (PDT)
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261019065025.2146539-1-claudiu.beznea@kernel.org> <20261019065025.2146539-8-claudiu.beznea@kernel.org>
In-Reply-To: <20261019065025.2146539-8-claudiu.beznea@kernel.org>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 20 Oct 2026 09:45:36 +0100
X-Gm-Features: AclHuK_0o_tLTtHRdwY1U_jUmzmwgKQ2ANnJ0QG91z7D7pQ5ZyLEGjAx2_i3mmg
Message-ID: <CA+V-a8sQe-bb7AEagc8QzQYVVY27+aVF2v=x1SxNtXQagpSOUw@mail.gmail.com>
Subject: Re: [PATCH v7 07/14] PCI: rzg3s-host: Use cached MSI address in .irq_compose_msi_msg()
To: Claudiu Beznea <claudiu.beznea@kernel.org>
Cc: lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org, 
	robh@kernel.org, bhelgaas@google.com, p.zabel@pengutronix.de, 
	geert+renesas@glider.be, magnus.damm@gmail.com, claudiu.beznea@tuxon.dev, 
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Claudiu,

Thank you for the patch.

On Mon, Oct 19, 2026 at 7:57=E2=80=AFAM Claudiu Beznea
<claudiu.beznea@kernel.org> wrote:
>
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> The MSI window address is already cached in msi->window_base when the
> MSI window is configured. Use it to fill msg->address_lo and
> msg->address_hi in .irq_compose_msi_msg() instead of reading it back
> from the controller registers.
>
> This avoids unnecessary register accesses.
>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---
>
> Changes in v7:
> - none, this patch is new
>
>  drivers/pci/controller/pcie-rzg3s-host.c | 14 ++------------
>  1 file changed, 2 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/pci/controller/pcie-rzg3s-host.c b/drivers/pci/contr=
oller/pcie-rzg3s-host.c
> index b0a150262959..6acb0231a067 100644
> --- a/drivers/pci/controller/pcie-rzg3s-host.c
> +++ b/drivers/pci/controller/pcie-rzg3s-host.c
> @@ -660,19 +660,9 @@ static void rzg3s_pcie_irq_compose_msi_msg(struct ir=
q_data *data,
>                                            struct msi_msg *msg)
>  {
>         struct rzg3s_pcie_msi *msi =3D irq_data_get_irq_chip_data(data);
> -       struct rzg3s_pcie_host *host =3D rzg3s_msi_to_host(msi);
> -       u32 lo, hi;
> -
> -       /*
> -        * Enable and msg data enable bits are part of the address lo. Dr=
op
> -        * them along with the unused bit.
> -        */
> -       lo =3D readl_relaxed(host->axi + RZG3S_PCI_MSIRCVWADRL) &
> -            RZG3S_PCI_MSIRCVWADRL_MASK;
We need to drop RZG3S_PCI_MSIRCVWADRL_MASK macro, as this now triggers
the below warning:

drivers/pci/controller/pcie-rzg3s-host.c:66:9: warning: macro
=E2=80=98RZG3S_PCI_MSIRCVWADRL_MASK=E2=80=99 is not used [-Wunused-macros]
   66 | #define RZG3S_PCI_MSIRCVWADRL_MASK              GENMASK(31, 3)

Cheers,
Prabhakar

> -       hi =3D readl_relaxed(host->axi + RZG3S_PCI_MSIRCVWADRU);
>
> -       msg->address_lo =3D lo;
> -       msg->address_hi =3D hi;
> +       msg->address_lo =3D lower_32_bits(msi->window_base);
> +       msg->address_hi =3D upper_32_bits(msi->window_base);
>         msg->data =3D data->hwirq;
>  }
>
> --
> 2.43.0
>
>
