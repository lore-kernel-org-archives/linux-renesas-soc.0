Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D498332EC5
	for <linux-renesas-soc@vger.kernel.org>; Fri,  3 Apr 2026 09:03:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775207028; cv=none; b=RWylqqDbCtcDhr9q93uYp2Mx6rsVig7wWpeJLMbWdPr357OMgxiTaXT5FjK9q5573OKxeW4KZwVE1fvrPuiwPdhtl7GBcz3I0R07fuulc5UItaufkJhVrchKpbiN59vJ6pRmYb56HPWMjF3g3qR2KHMgqrI3TXSIXoqkgQrEMRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775207028; c=relaxed/simple;
	bh=LzbdcnOypVgl8XAOqdjkt07np0ZsfX2Gis+Z8CybTVI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z4KSlSsPldP91LcQOwWZp4wkMlCVO4CAZ9ZHNNJctN4cMiV3K1bEG2KXTh6KI/4a2wqi/GEDtpQu3TWR1G3HmyLk8aLDUqjQrRBs2QKvqG6ev0R4pPYW2t5dVGwveLLKIeWo393w6t8B0aKS7vId5bWXjdgMnp7ABu74bmfPvsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-56cc67e01deso1596178e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 03 Apr 2026 02:03:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775207026; x=1775811826;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P4PkZ6R/mmLwRiMLG8oh7K/G1iaMQnAp/Sqdg+cClo8=;
        b=ZMggJTK4soqLRFL9k9M6REKJv2oqbQvydR6/7G54Z5377+IHX+NgEjxkvCNO4nMJ96
         0tXaMcPj3h1+zVjV4T1WVoNRxAiAl63+AREXburIP86QvlMloxjh4MJEcCmLsH8qjHsF
         aEZObHQ6gljTgNsdzz8j1FwXMMz2tbu+9xAt0cO4U8hgZcJt9pd0iYDPxc11CufPkYZ9
         75aSALxHL9fHuWemSiPg4mjNXkpGGIKG6C2+4sOfOk7Dv19dDKQyTRY08WPdJNWbzv/P
         tjH8SFNmV+cirHhrz+kVLgS8N7qmsBEYq5sZV0pf4uIpyxlSkoiI4XjPwCKeEQvKR2T5
         n4Qg==
X-Forwarded-Encrypted: i=1; AJvYcCXPPf1o3Qdgf5bqmMK6LByaG2s96kgnE/QUvh0s+sDkTedvfT+M++EEqxmx1MwRth7ge6bzE9BNk+awHI1jgbfs3A==@vger.kernel.org
X-Gm-Message-State: AOJu0YyrXGTDnuJFJRdprTdhySxsJxGhUzPlWrM3WLS7p5LfRNDmOywa
	xAcs24Cc6yW26O8QwVVQxshkfidus3dc2bXiGGs6PAvWeebyvHtBBphanD/HqaCs
X-Gm-Gg: AeBDietHNnQJG8kOHOAJ8JAw5BLvcLMYPhRn+991+I/So8CTSLvRmbc+F6LIgZlVNn4
	dvGqIh9pI7mwzLoo07ZGKAXrd/c5QuxCxCdzlyk4V3mw5+r/QcTEV6p+NH4abx9vFENKslJUTxe
	tLUNQYwXy4GR1aOw5vqngTPU9MdeS1Oboyu6tNS2EjVKRyr//GwAjOvloQmxZHeml+4d9Riu3be
	JJmSXtNg0RdQjzwoZnSxosLuyBU+KXV+B4eSEevLSTo2ygyw7CxyjzKDr8KWQUEWxhgJK4R+eJU
	HJgNaVKTEnc7nQITsXAXlOdxOos+m2X34WusAAzT7JnyWYPatL7H6abbrCcZSZJBkCvFF5nrETc
	2/LiwwrJ4HS62Y3z8nxGDu5HX/iPEhc2mFjBllDOXsG+uPuebZmXUe06QeNopsFdxcZLW/0WBv4
	ywU2IUlyVVERSOEt0Nu1C14ZATMnXBkOXnf3bU2xuPxR2enD1Z9Uw0180ywJwEGElo40tXDeQ=
X-Received: by 2002:a05:6102:148f:b0:5ff:e25c:928c with SMTP id ada2fe7eead31-605a50d5344mr793516137.24.1775207026058;
        Fri, 03 Apr 2026 02:03:46 -0700 (PDT)
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com. [209.85.222.45])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-953fbac435dsm5668439241.11.2026.04.03.02.03.44
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Apr 2026 02:03:45 -0700 (PDT)
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-94aaa5d3bfcso1001406241.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 03 Apr 2026 02:03:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUn5GeDttlWnjhC2uRix4wqPqNiLeHcS7sm50qgQKC0eQXi4Tm+MpJ5zz9af0vv6cQULNkxWr2iVvMk9iad9nfISA==@vger.kernel.org
X-Received: by 2002:a05:6102:c13:b0:5ff:fd17:d74e with SMTP id
 ada2fe7eead31-605a5172896mr777997137.34.1775207024732; Fri, 03 Apr 2026
 02:03:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260326042411.215241-1-marek.vasut+renesas@mailbox.org> <20260326042411.215241-5-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260326042411.215241-5-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 3 Apr 2026 11:03:33 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWATjW+xKMDHvOGQxbU=vby-ksN-Sy-YNXFz+O5mPHxxQ@mail.gmail.com>
X-Gm-Features: AQROBzChiJZliz9l44U0EaEXy40FbPu9KG1qcLT4sL3xvqKa_3byt050paJddGg
Message-ID: <CAMuHMdWATjW+xKMDHvOGQxbU=vby-ksN-Sy-YNXFz+O5mPHxxQ@mail.gmail.com>
Subject: Re: [PATCH 4/4] arm64: dts: renesas: rzg2l-smarc: Fix missing cells
 and reg into DU subnode
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 26 Mar 2026 at 05:24, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Add missing cells and reg DT property into DU subnode to fix
> the following warning:
>
> "
> arch/arm64/boot/dts/renesas/rz-smarc-du-adv7513.dtsi:29.10-33.5: Warning (unit_address_vs_reg): /fragment@1/__overlay__/ports/port@0: node has a unit name, but no reg or ranges property
> "
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
