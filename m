Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792502966;
	b=akVwNC3AgYOBLrm+PC1lXU2SdCzSEgZ5i7z+pUObzbjm3FrMWbHTurYFSwtlz22CroAW
	 5KV24JP0JPUcC+S1Oh5DT0o+zDG6yDDskILJVW1jvIApFwCn7gbOa8sDnjXX6h4293mqs
	 CjxprKwLRZPZGVpPXVxfHtFWYR4DoLPb0+CrYVWwaC6Zvuu6JOBP5YdxOZslYM8F1jvV5
	 DZaxsNNdnHscpcJivEGyLYp2qiq1MVgjTl67btHSMmROOoqKSA1usJ4MkdW69sMLkCgef
	 JJ0pdJsscK5GkCjVMu7y5T6Azr/8UIPrTgEn5vSvk69Ai8LGn9+tFg9f/bqKpnXcoWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792502966;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=D+mxgjdi4ZCAmeQ/8ywDwvDse5W9MOG3smctM4dikj4=;
	b=X2nlziK6W6iBcz8M/W2DjgIprlv7Y5/4SCXr6z1dFzoZagvSEMlBj9u/lve36AoEz/0W
	 EkLS8vhp9Lbcqf6GtTKMR32O8yCqGPEb3AaOLyj8fbUgGuxbllexC6TiV6pC9P2+eI4lJ
	 SO+VGGOCWcaW6Z3l9cuGyIC3cy9lZzLehxMRmpBsfoeYi6SBjwWQaPd9usMvPrk29LY4b
	 IvB+Hs+YdIr6h8fpe2DBiVGkSvtbhVtbDkvZmVNgbT4OOkqOIaQetYYfsbH9wxl6LopDu
	 nRUXPrIGj1IV5WDOuq9CvsSDbfkZRXga8F9XOw6Vqu+QFZEFks46izPFdWnlkknbNjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.208.180
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8467606A319
	for <linux-renesas-soc@vger.kernel.org>; Tue, 20 Oct 2026 13:29:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8467606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-3ab01c46697so24413621fa.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 20 Oct 2026 06:29:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792502964; x=1793107764;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=D+mxgjdi4ZCAmeQ/8ywDwvDse5W9MOG3smctM4dikj4=;
        b=hyJi8+7dXaOvo6fR6hELssY/OAwOVQMV4G56izGyVBtQb3JPkTq4QyGPSUE3uX6Gxx
         MmN5BtbMI71RV/eKijwL01/+kV1jS5avOcvF9pZo7lHOLQI0R/vJH//hn+iSTsGUqPvL
         qBy5bOJBsZluMPCPTRhrAoSeYECIfGeedsFxnH9bcp+mbeRlHehvK8YN7G3QXLfPrP+L
         5jf0O3Oq9BKllqEtEHWfZxBp+mMhRr8wPedIxDhHRNIR8WuVVAsjkwzkGXNWLi6aWWaJ
         PJMAdUpbeyS8WqsOtVf29aCHjg5dVHvcZxDE7wGQDCoVNZsH/RSH9TsYEME9Jb6U/0I0
         Cdaw==
X-Forwarded-Encrypted: i=1; AKwUvBweCkRexLOnI1WEBtH7kX13HMelljuCk4ohGHlFJEhOLQouzVeOpUa4rgIVHNouw2EtJCvvg2pYEnAWNyN08776JQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYJSBhXO7Vf5Zp6KPM83HgOlnwQdOj1B07FhyRV0RfnhCfUPv1sr
	t5bvU0tImXrUvkvjKXwBhne4q0gHgIYKyaEpMfSKDBRGTl0UBYyhKTqzhRmmRR//CUs=
X-Gm-Gg: AYBFou03RvbQOErQOvuDSaY2V4fa2FPT4mSF06+PuX0pfLTXY8oaO5skFXF71p28wjd
	q05JvSVHDmZvRnAhdJbDEHrWLz6Sz5pgbggvHPtQKJqAOBeC6ofD4rD0y9QifLka0rDtVz5ufLF
	DwhFRtqxZcE6Gt8lFR+BH3jnMs3T/1DgUHsmPE6mPXy9aokU6W8syS89my6J02lCtnH/4wKva+j
	F6vq6ZwlddaIxnabdIpHVE6LxzT7cp+iEh3sm7qMp+k6CaIALZFUpmp917Cvs3WtAalUZCVlx05
	xEcs46Q+Rd1J4KH2f4fq2tNp/GVemO2DR5Uo3sGe0VJXL+lyDfFyARMzmW86N2lolb4PCWJ//xG
	h8DeiUp7Os1RW+cZo5CHhEtuHa82jrs4Q2QSELpOag1e+Jve4112pv1AkdAh+dE6RilRK6LlLSi
	vriUCoPnVcRSVBjfO5P/ybQwuRbXK6zY9MGiaLGwCLF6qTZHE/9zIeflL1L9kX8n1Vhwfb/ykJA
	XdaK1RwYibGPCaNAiEfXY/qGWX85Xcn9cVkM/bJqdIzGhc=
X-Received: by 2002:a2e:a9a1:0:b0:3ab:4eb4:5ef5 with SMTP id 38308e7fff4ca-3ab4eb47b01mr6159401fa.9.1792502963612;
        Tue, 20 Oct 2026 06:29:23 -0700 (PDT)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com. [209.85.167.46])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ab16eb94c1sm31674061fa.38.2026.10.20.06.29.21
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 06:29:22 -0700 (PDT)
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5be42ae8eadso1875178e87.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 20 Oct 2026 06:29:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxIsolKH9XdNvUwxJxfCkQdjyyMEKSbVjStXtgRsXMxbNz7LKF2rqFyy5ngNe41aw4CPY8V3WhlHb2F3pNKTDoj+w==@vger.kernel.org
X-Received: by 2002:a05:6402:270d:b0:6b1:c7d9:b631 with SMTP id
 4fb4d7f45d1cf-6b3a8191a46mr7499369a12.23.1792502542847; Tue, 20 Oct 2026
 06:22:22 -0700 (PDT)
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261015-epaul-v7-3-rc1-x5h-vsp-fcp-v3-0-e052903a3832@ideasonboard.com>
 <20261015-epaul-v7-3-rc1-x5h-vsp-fcp-v3-15-e052903a3832@ideasonboard.com>
In-Reply-To: <20261015-epaul-v7-3-rc1-x5h-vsp-fcp-v3-15-e052903a3832@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 20 Oct 2026 15:22:09 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUHcR8-9g+KZ4Ssj+mJKYBz1h6QSjWnaPL1BcQWC6v8RQ@mail.gmail.com>
X-Gm-Features: AclHuK_uZzRO_WalfaTseMvUVupoP686uPVQ89YYU5UfnQv3EiXJeP7RDzX6u2Q
Message-ID: <CAMuHMdUHcR8-9g+KZ4Ssj+mJKYBz1h6QSjWnaPL1BcQWC6v8RQ@mail.gmail.com>
Subject: Re: [PATCH DNI v3 15/15] media: rcar-fcp: Check device revision at
 probe time
To: Paul Elder <paul.elder+renesas@ideasonboard.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Ulf Hansson <ulfh@kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-media@vger.kernel.org, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"

Hi Paul,

On Thu, 15 Oct 2026 at 09:53, Paul Elder
<paul.elder+renesas@ideasonboard.com> wrote:
> From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
>
> Verify that the device revision register reports a valid value,
> otherwise reject the device.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Signed-off-by: Paul Elder <paul.elder+renesas@ideasonboard.com>
> ---
> Changes since v2:
>
> - Add FCP type information
> - Reject devices with an unsupported version

Thanks for the update!

> --- a/drivers/media/platform/renesas/rcar-fcp.c
> +++ b/drivers/media/platform/renesas/rcar-fcp.c

> @@ -154,15 +204,67 @@ EXPORT_SYMBOL_GPL(rcar_fcp_soft_reset);
>   * Platform Driver
>   */
>
> +static int rcar_fcp_setup(struct rcar_fcp_device *fcp)
> +{
> +       static const char * const models[] = {
> +               [RCAR_FCPF] = "FCPF",
> +               [RCAR_FCPV] = "FCPV",
> +       };
> +       static struct {
> +               u32 version;
> +               const char *name;
> +       } versions[] = {
> +               { RCAR_FCP_REG_VCR_CATEGORY | RCAR_FCP_REG_VCR_REVISION_H3_ES1, "H3 ES1.x" },
> +               { RCAR_FCP_REG_VCR_CATEGORY | RCAR_FCP_REG_VCR_REVISION_M3W, "M3W" },
> +               { RCAR_FCP_REG_VCR_CATEGORY | RCAR_FCP_REG_VCR_REVISION_V3M, "V3M" },
> +               { RCAR_FCP_REG_VCR_CATEGORY | RCAR_FCP_REG_VCR_REVISION_H3, "H3" },
> +               { RCAR_FCP_REG_VCR_CATEGORY | RCAR_FCP_REG_VCR_REVISION_D3, "D3" },
> +               { RCAR_FCP_REG_VCR_CATEGORY | RCAR_FCP_REG_VCR_REVISION_M3N, "M3N" },
> +               { RCAR_FCP_REG_VCR_CATEGORY | RCAR_FCP_REG_VCR_REVISION_V3H, "V3H" },
> +               { RCAR_FCP_REG_VCR_CATEGORY | RCAR_FCP_REG_VCR_REVISION_E3, "E3" },
> +               { RCAR_FCP_REG_VCR_CATEGORY | RCAR_FCP_REG_VCR_REVISION_X5H_V1, "X5H v1.0" },
> +       };
> +
> +       unsigned int i;
> +       u32 version;
> +
> +       /* Check the device version register. */
> +       version = rcar_fcp_read(fcp, RCAR_FCP_REG_VCR);
> +
> +       for (i = 0; i < ARRAY_SIZE(versions); ++i) {
> +               if (versions[i].version == version)
> +                       break;
> +       }
> +
> +       if (i >= ARRAY_SIZE(versions)) {
> +               dev_err(fcp->dev, "Invalid FCP version 0x%08x\n", version);

You're missing a few variants:

    R-Car V4H: rcar-fcp fea10000.fcp: Invalid FCP version 0x0000010a
    R-Car V4M: rcar-fcp fea10000.fcp: Invalid FCP version 0x0000010b

> +               return -ENODEV;
> +       }

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
