Received: from mail-vs2-f41.google.com (mail-vs2-f41.google.com [74.125.227.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CA85489879
	for <linux-renesas-soc@vger.kernel.org>; Wed, 23 Sep 2026 10:31:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790159523; cv=none; b=u9FxgpdmREn1Lfj9Ga2SyjdnFOYLmY9qeF7oFuy8ucTILKqSU19knEwJhR6ONgdgBWuixAmdQPkSSS8fej/wW2w7rSTfVofm0rhwKRaYCidKjqErH8rFXtvfgBl2OmzsMlxGPwCR1d43Ho9fZ6iq0ae+5tHaqPZeooVGJs+wbbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790159523; c=relaxed/simple;
	bh=qHmJ0LuimTPz5IfDSza+MI0wTd/JNm6z/p09kQHUHlo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Leu3R+W7LkARck/7s2Lx0hV3YKM71t8urjds57vnjsNbe+aePqa5xOZpWPvhp/97QCt24GIggZbLqUrHtiKKBARJnmUkwXoVh45IJ0DcEkKuYVokH0tx5KxWplOYJpmB6roEg2Kjbqvj/D2vj61d2lhLC9w9ml15CvKJ/9ZWeMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs2-f41.google.com with SMTP id 71dfb90a1353d-5c67e5292fdso323576e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 23 Sep 2026 03:31:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790159508; x=1790764308;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=otCNGSUWSvhuDPnjx1VVioLIbir8+cGg0W90YM641IM=;
        b=XW6Nokrc8rpg2Y+qXxg1LHI2fPj95C+lubXcFdPdy8+7B3lbTrwDsJQNGtPpJO+o93
         aVw9zJC742Zjk76Kp43PQwb0Xkv7HfOIcHphYD6G4kx60KD+N/LfAPXElMnA8G9d7Cca
         0rz4aJi8fxJ5fxwp4FeQplyoYtSpQuTeAbUYCO2jMIYKVdcQJK6ugJ3B6oYk+5hO9DHW
         ThlcGKNQ46RHmHe2bj+FNWHC+QTEE5B5pYnQVCWoqbSR1mM5Xxov+NlnbTuaoO5Kiftn
         Q1Sf/iuN4nFG/JUz7OCOYspHE6S4Lne/xj5hWeg239PP+rBqONCXaOt0uw0sdQE+BrTD
         UoRg==
X-Forwarded-Encrypted: i=1; AKwUvBzHmR2IpN7U2v5c8a6ZIaLo/fOKwge7bG1BqCo5e+BbO0vdhRPdiPvvyLbUXlqIqIFG8A7adwLqsSIHF6broqeYFQ==@vger.kernel.org
X-Gm-Message-State: AFuF++kWwCB5OaaMzSH1xJmr1vqceBTZKPabL0zLWqLBnkzRNxxCI3w2
	klnjgOE01egdT3t/iCtxxC5RI9YpMXXlt7qBnDyiR7/dd8SfGF3B6/fGQl7NtlIn0Lc=
X-Gm-Gg: AYBFou2He13dVm7JNKsnL0q9hOP/Y7fHSaOxF1BMpZhD0b4/h0Ek/ZpGmOJn6FXe5rQ
	r04JlPBLj1p5U2+4EtnYa4IZIVeAR2YbcNcWK/16Ee8P+ONUqe9G+Ero6FVn2rp3ufdZI5risqk
	CfzzEY2tgMJC6TVycglru+jjy/bZ1gvFw7a8Ujl3DahOXglUP/qq+NKIW1MFXHPnqRjBoCNJxlr
	4yJuudq/7lFVlqNzwxUhHsbgLW6ht3jPQzU4jFkelRjT9FxijKa//9zHq1tdPKvc2EZAxcw4yna
	oNZ1TxqFa67F3e4P/j0CKsuAxaBM4X9HeWIJIsg73KsesDsUuVVBQr21L50mkd6uphyAKKfdyy7
	l+xtLMcRBg/LMQJyNqPid++XKom2FAVgiUeK8JnAHOscFwpK6JrmDq+kzSwX0uirOjYVNpgGbXv
	iCJEgZ9gIR/qxuN4zF42g0U1XJteL7pqnSBGNnMQpJm0jn8fCZE6lJZYEPuqZ+QuVE9NKOKOvUi
	fvwQ6yGTk10lSjhloZV9cbiOvddGoDyozAYMmyExglJkgU=
X-Received: by 2002:a05:6122:552:b0:5c6:81c2:5496 with SMTP id 71dfb90a1353d-5c9f1580418mr2513822e0c.4.1790159508448;
        Wed, 23 Sep 2026 03:31:48 -0700 (PDT)
Received: from mail-vs2-f12.google.com (mail-vs2-f12.google.com. [74.125.227.12])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c9f04c05b3sm2759650e0c.6.2026.09.23.03.31.46
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 03:31:46 -0700 (PDT)
Received: by mail-vs2-f12.google.com with SMTP id 71dfb90a1353d-5c67e5292fdso323568e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 23 Sep 2026 03:31:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwux4wQko5PHmyVDaj9FeofofSZVGVHSRFtNob6OSY4xPtD6aVDkvkucvY86llohdBXkl4inpD1eJFRL1DTJ2gq+g==@vger.kernel.org
X-Received: by 2002:a05:6102:370b:b0:7a1:f971:78f3 with SMTP id
 ada2fe7eead31-7ac1de3bd78mr2006784137.31.1790159506008; Wed, 23 Sep 2026
 03:31:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260921134432.50338-1-ayman.chaudhry.kc@renesas.com> <20260921134432.50338-3-ayman.chaudhry.kc@renesas.com>
In-Reply-To: <20260921134432.50338-3-ayman.chaudhry.kc@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 23 Sep 2026 12:31:34 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV6w13GNnQFiCWGkmW-=mwxnkuKJvp7=AF_xpb462C=xA@mail.gmail.com>
X-Gm-Features: AclHuK8KfViTXJxG4ecvsKtRjnbyEzEnCYUI_WTdfSW3Wds9FPM263MV1B6y2_Y
Message-ID: <CAMuHMdV6w13GNnQFiCWGkmW-=mwxnkuKJvp7=AF_xpb462C=xA@mail.gmail.com>
Subject: Re: [PATCH v2 2/9] dt-bindings: power: Add r8a774a3 SYSC power domain definitions
To: Ayman Chaudhry <ayman.chaudhry.kc@renesas.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, 
	Chris Paterson <Chris.Paterson2@renesas.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, Ulf Hansson <ulfh@kernel.org>
Content-Type: text/plain; charset="UTF-8"

CC Ulf

On Mon, 21 Sept 2026 at 15:45, Ayman Chaudhry
<ayman.chaudhry.kc@renesas.com> wrote:
> Add power domain indices for the Renesas RZ/G2M v3.0 (a.k.a. R8A774A3)
> SoC.
>
> Signed-off-by: Ayman Chaudhry <ayman.chaudhry.kc@renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v1->v2:
> - Updated commit message
> - Renamed file to include vendor prefix
> - Added vendor prefix to include macros
> - Added Reviewed-by tag

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in a branch shared by driver and DT source code.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
