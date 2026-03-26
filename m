Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1FAC2773EE
	for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Mar 2026 14:12:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774534364; cv=none; b=Bt4gKYrLWjmf7tmWs6kA3mrMb3fRx1cK097RyoVZ+2yPFvYET6MVnfDg5Sao3vA5kygDQjTsO6dNc8ma60+puHVrwUsZTX747l/kVxt+tPscS3Wle15BM2y/rmMSpVERlOb/lcCTzBjiWF0Ghen9oehzF7OwtEty947BBoDmyRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774534364; c=relaxed/simple;
	bh=LrtNtHSmO4hzVyw5+PEvmHrePHuoHtR1t9d/gmGKyFA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JLNealxJdR7hnf8xdf+e1uukxxlYXSaTOV7zU/J0RpMsrzeEIxf4PlFOxWEYFxNvhhu2wlRzBgCnKqmph5RKELZZJXbhGwbFF9d4kab5FEQWb7UDBkL2NiRukgKu3lK0/PQdBzAqZVbfgSopcMoCfq+BGEya4HXkBeLCW+Hg70I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.210.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-7d75371d873so1112127a34.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Mar 2026 07:12:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774534358; x=1775139158;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5GU4kGMAIQG/ljX6qMbUY/Mk2ED5n18dQJ01whvarEI=;
        b=QfSkFOewtXI7ABriJB89erW9qxIOP70WS0yJK21n7cJ/cxSf2OXTWh0RYCuwKXCYLN
         hr7L9mYHBtmOCc0Ljw2fCEgbXn5JhSMiuYmB7XyHESnYrnVlRQYT85FFjI27WwWcmfNo
         UNrg06/rDU7NXdwcADAJA6ksw/NGxKW8+Zo525g6Wb3AkisqJghzpMa8vXcBtgywRyH9
         QzGPbwfPagJ9AkGOBJlU4hA/CiQ6nt0MNdiaLDhDwUm116taoa6VgRMO9WrENV8PEckC
         LDzK2CknODMiHNXC8ehIORePpdpHlkR6RLHM0Y11e+kujUC0tXG26srHDDSJhqwPC8id
         7Xqw==
X-Forwarded-Encrypted: i=1; AJvYcCUxtLVS4fOYzw3X2Dyl5bbrPl646mYH+rD8o2T+L2WLFGuTk+0GTrys6WZfpaupj/wIZyLbfwzF9Xb/d5fl4dehkQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwiYFIWKfWS4X4Mbbq47VCd9lKkMoAx17AcRDsneAQ4q7jKUGlt
	r6/pDs2a7vz9u6kepbmeEbwip58/vxCb0rji1XCXt4p61LiTVfxbKi6eiToRdIvEhAE=
X-Gm-Gg: ATEYQzxFkgvQXBZ087VlR/1kxJd5bBh63IK/iGZVfldvMnmuNh7wcahL8MgR51VFqaY
	gSSpzf3HefonOQEGKHGn+u9sVGvHrWX7OJljx9Yv6jL57+4ZRXJVkBlCcFezYofwFZIHRrlh6eC
	xjRbqIIaf6jbbH6as2OCtOaa5it8Ih5uO4whAXNWOl6UxGXWO4tXODbqjnKE6eUbV5V8SIbsyVR
	n5yRpjhT5CiHHnEKKPWdHvWCWWWV4AKjEdIHTSdcDPosgCAsMLYRxAkCMDle0MuFot4FBUUCNif
	j77tNA6TYF3iIVjfO3aFqF1Q/6qyCdyjJT0K9Md8XR0I7xqq3gdGslLDLm3gKQ4kN2pwjR+JElz
	0eZQXK41EqELZ1iXo+5ofNP8vF9mlEui2kGoxyOduGZiuz04kWf4xqBl39u3wePd74S/qzVIoAE
	H78NByVfPOpolIBWDjOC6Gb1xtsSzn/CeaJpm1q1yIjNY6o8iDjwcLvri6ciiY
X-Received: by 2002:a05:6830:43a2:b0:7d7:d8ca:c211 with SMTP id 46e09a7af769-7d9d6731487mr3439208a34.1.1774534357958;
        Thu, 26 Mar 2026 07:12:37 -0700 (PDT)
Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com. [209.85.161.45])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7d9e729724fsm2277207a34.27.2026.03.26.07.12.37
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Mar 2026 07:12:37 -0700 (PDT)
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-67deb70bc76so607055eaf.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Mar 2026 07:12:37 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVkNupHNFxdfrCSwqurodGorst/Bx8S3IiVCqyg0096mz3ExASuEYhwiIsZ8rioffHA1pEZ5OiUsyD2WcOJvecvIw==@vger.kernel.org
X-Received: by 2002:a05:6122:2986:b0:566:341b:4dde with SMTP id
 71dfb90a1353d-56d21d0c273mr3553159e0c.0.1774533935389; Thu, 26 Mar 2026
 07:05:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260304071732.5864-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260304071732.5864-1-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 26 Mar 2026 15:05:22 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXRn5v9c6=ge9vj_mFE7GQEX2GXbvEZxqeEvMtuXzM92Q@mail.gmail.com>
X-Gm-Features: AQROBzCl45J1B9gqwnevHhO41JWo1n_Q5hR4AHiytVtLIAcalXI_rirZOBLvto0
Message-ID: <CAMuHMdXRn5v9c6=ge9vj_mFE7GQEX2GXbvEZxqeEvMtuXzM92Q@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: i2c: renesas,riic: Document the R9A08G046 support
To: Biju <biju.das.au@gmail.com>
Cc: Chris Brandt <chris.brandt@renesas.com>, Andi Shyti <andi.shyti@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-renesas-soc@vger.kernel.org, 
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 4 Mar 2026 at 08:17, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Document the Renesas RZ/G3L (R9A08G046) RIIC IP. This is compatible with
> the version available on Renesas RZ/V2H (R9A09G057).
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
