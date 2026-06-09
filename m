Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F63638E5C5
	for <linux-renesas-soc@vger.kernel.org>; Tue,  9 Jun 2026 09:55:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780998929; cv=none; b=krQl92kJVE6C26Q0alwre+sfYaBMp7jKnhX4Y0IToBwFRVFoLAzT/lUyKrc1nW56osxo8V3rDNclCkKjmPuSo10VzFkLFoJt4EYqqrkP9z7r/KDoii2n4zuRAuZDWBZU7hKH2Akl88YAZB3wSgzdEML0jblDl9tWuiFVEqwN/6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780998929; c=relaxed/simple;
	bh=LMAkeVaZptDMfPIXMRgnhcXwRYr1AtJoIiiI7hhG/Hg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kffoH2sVeXPLBNJ0KYkmtjlrWoUwu7IyKBi/6VE3ee+hhQlLf/JiRFiuAGzSO4VQ2b3yldtE44yDSoLqzBNPg+xRdBbWjZIQuN2zGqAkESzLyM03Xsllv6WGSL4+isQbPszjkbZ1X6VbK7zydeOaMll0BpxHhNASaU4nXBpVeSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-6c534af2470so3506052137.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 09 Jun 2026 02:55:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780998927; x=1781603727;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J/QDHCd1pzNPKIKT6XsNCXh/My/ujozGgvsOiDCA3LA=;
        b=DbXl6WZfJq5F7JNXnMNmUq9HQmp4iK9n6KeoEZul5BbQUfqBO3+MdvIbK3tM6wCjwn
         o1yPLpXH7+lf2rKCGCEiZwGq6Rcsyugao5beyTC1zbRSNQV5czlwvqhXhEv9qCs4wHaX
         geBtn8ywo8bnEjkVeaEcAThViEuxjhr5SooDkt/MogLeA1BWxOnKYy8FgB1XJZp0nv8U
         MHA+JJBb5SPHRca+fppEd8rh2wnFENFhoc1PRgt+YlthbxfwHV3061AV0ZNKSOa2+TgI
         9pOz7vHBWwXQTro6j+gqNQ16ub7FC8QXcK9CAU7ggZZvG8JLyob+K8bVR3vPZEDUAQXQ
         kXDA==
X-Forwarded-Encrypted: i=1; AFNElJ9mAAMF9aYEKk3PYa5RmWhQjrOQQIdsL3TBPgB+4Ad0JeGUBQ2EYIoREHBCA63CCF/1nz008nNjG+wgVkERjE8fcQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzJx4p34028H9/VK2hVUPcfSfqvrQCpS1VlEvib8agyK6CRAta2
	80oQQwR09kjjAOnidh5dyYPK4SStbc6i5tsKJpqODY9heM2T6Cpxa7Nf0mWZlt1v
X-Gm-Gg: Acq92OHpDaLZpW2RaeHuDNkoq+83nbEfQmq0FQuq/eEkpp4A2jeIDivIVplm4SHM7y1
	00sJUz3chEtjq1DBmT1+rnSvgajFI6KQReoQcA2imWXOghbgqmgLlx1+cn1/nEFlFqI0iWNmo52
	LsXF959QuHzAhCS/GIQWkNug8mkBydf0ygwcOGjntTs+LrIzW7voLSFMmRB3GwkmkWRmF/IglB9
	JDiRfQMH5bCrMRnzf0utJ2nzBuAi+1pHKUwHtU5ltX0prjKXxPxSwkaQoTkeSewzr+XpsH9zena
	ZOgxe5ZYKbSOIFtykMlQQb2BTezuNweE7mZ01ddTRxMjM0U93w2vQf4SBegGtAep7nkQ2wTrjOa
	K1yQS60Bk69j7Y+rfNV2k/IYxYtT3o28k+g0Gj4NDDFzbkh4XdlcLOLUvUU+G5YZ6F35RRQqkQ5
	I7UBx4488zPPZ8DSE/1aF3m0HTsZQruG+MZmi0zYemVOSDo5L6SMUZP4PzrEyeg/HhBQsiR9I=
X-Received: by 2002:a05:6102:cc8:b0:62f:3abe:907f with SMTP id ada2fe7eead31-6feed1adbffmr11601244137.4.1780998926918;
        Tue, 09 Jun 2026 02:55:26 -0700 (PDT)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com. [209.85.217.50])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-6eb55494b46sm16545959137.1.2026.06.09.02.55.25
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 02:55:25 -0700 (PDT)
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-6cfb0a137c9so3339021137.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 09 Jun 2026 02:55:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9XStO9Yb/9EHxVMHaCpH76FF9ttvPFl89MWd6GSV4lnnbFjmS074uf5P6zbiXZKSSM+PdoDfGr4f0Tufcrqr3b3A==@vger.kernel.org
X-Received: by 2002:a05:6102:149a:b0:636:984a:1e5d with SMTP id
 ada2fe7eead31-6fef05f052fmr11135049137.11.1780998924802; Tue, 09 Jun 2026
 02:55:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260529150150.1670604-17-ardb+git@google.com>
 <20260529150150.1670604-32-ardb+git@google.com> <CGME20260609062840eucas1p1d49831bfdb3447e38a3cadc803a9afc0@eucas1p1.samsung.com>
 <a1b27e97-182c-485d-a448-56c19c5de2c2@samsung.com> <6a9c0f55-fe98-4063-864b-8f7e1f4fefd7@samsung.com>
In-Reply-To: <6a9c0f55-fe98-4063-864b-8f7e1f4fefd7@samsung.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 9 Jun 2026 11:55:13 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV-rH7s6GD4FtiKP9++3c2ojwZKm=YGLM_S_+nkj+EBtw@mail.gmail.com>
X-Gm-Features: AVVi8CfDur0wzec2mY_1awm30cbHrLvunVYojJnvz6Cb53IUltKkdZGFSORVN6A
Message-ID: <CAMuHMdV-rH7s6GD4FtiKP9++3c2ojwZKm=YGLM_S_+nkj+EBtw@mail.gmail.com>
Subject: Re: [PATCH v7 15/15] arm64: mm: Unmap kernel data/bss entirely from
 the linear map
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Ard Biesheuvel <ardb+git@google.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, will@kernel.org, catalin.marinas@arm.com, 
	mark.rutland@arm.com, Ard Biesheuvel <ardb@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>, 
	Anshuman Khandual <anshuman.khandual@arm.com>, Kevin Brodsky <kevin.brodsky@arm.com>, 
	Liz Prucka <lizprucka@google.com>, Seth Jenkins <sethjenkins@google.com>, 
	Kees Cook <kees@kernel.org>, Mike Rapoport <rppt@kernel.org>, David Hildenbrand <david@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Jann Horn <jannh@google.com>, linux-mm@kvack.org, 
	linux-hardening@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-sh@vger.kernel.org, Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 9 Jun 2026 at 08:28, Marek Szyprowski <m.szyprowski@samsung.com> wrote:
> On 09.06.2026 08:22, Marek Szyprowski wrote:
> > On 29.05.2026 17:02, Ard Biesheuvel wrote:
> >> From: Ard Biesheuvel <ardb@kernel.org>
> >>
> >> The linear aliases of the kernel text and rodata are also mapped
> >> read-only in the linear map. Given that the contents of these regions
> >> are mostly identical to the version in the loadable image, mapping them
> >> read-only and leaving their contents visible is a reasonable hardening
> >> measure.
> >>
> >> Data and bss, however, are now also mapped read-only but the contents of
> >> these regions are more likely to contain data that we'd rather not leak.
> >> So let's unmap these entirely in the linear map when the kernel is
> >> running normally.
> >>
> >> When going into hibernation or waking up from it, these regions need to
> >> be mapped, so map the region initially, and toggle the valid bit so
> >> map/unmap the region as needed.
> >>
> >> Doing so is required because pages covering the kernel image are marked
> >> as PageReserved, and therefore disregarded for snapshotting by the
> >> hibernate logic unless they are mapped.
> >>
> >> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> > This commit landed in yesterday's linux-next as commit 63e0b6a5b693
> > ("arm64: mm: Unmap kernel data/bss entirely from the linear map").
> > In my tests I found that it breaks booting of RaspberryPi3 and
> > RaspberryPi4 boards with the following kernel panic:

Seeing the same panic on R-Car H3 ES2.0 (Cortex A57/A53), but not
on R-Car V4M (Cortex A76).

> One more comment - reverting 63e0b6a5b693 and 53205d56212c (dependent
> change) on top of next-20260608 fixes this issue.

Confirmed, too.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
