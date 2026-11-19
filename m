Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795076625;
	b=rHkUR+xaAde9m1rUj2qITIsuhRhzCuOQbYJteQ5cQHuf4paoeulXRjllzq5ZeIYzWzUb
	 vPXV1ebccc3HXx8SW+cdJHIcsVpzi2wBz35NW3Ws4rc7ty6ocD/q/WkHXf/1Mp07hN9UE
	 bQFZvXOCPKbG0phSs8XPAwturq5QBsCn6EAKHZUoTnuzCDj7sbxkoSJI+ILRPPHy8nyb5
	 srliKMHKuZjTmUGHeknsb22kaj0/njCSmUVwFHE8vPPWVL+fvz7HWsq3gjpjyUGD1R9ea
	 wzSZlF5OXJQObqQJ6RVjtX5G0qxUtu/UcRF4/sTM+WH3dJpJw+C1jL8JrS6VTtLks0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795076625;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=+hfyVl1XUQA6cwLu2cPCDOrlTt5udZgDRMAPyOiNJi0=;
	b=XP1iUEfLMWd8i4JNOjxmRD5EH0qmW7KKqgtERDH0IvVIH8D6Oy95d/8b6FErUBSQQz02
	 /QORWJxvuW4Hj38DG3kCHdbIO26ZUhrVWcaRi98anGCvMvQr+nxfVEEN+gCIMXu79lLpR
	 10paPSeQpfMCUwZVLRvkc+9qO8J67Uabjl8CACnA5AnKz76atMFvdkMdMmrzcTe4/cH83
	 YboFnS0QJkgObFi/cn+aOT4zRjJklH5JY3zorW7dvJiuNZCIkL8FqfmSTOuG9MnLUDZgG
	 MZB/66cezV2u+gn8w+XRvCymWm2jAPDQ40f0/1U8Q3SP22PF5svGMzl5B2Ceb/EsABQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.217.50
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46F3F606A320
	for <linux-renesas-soc@vger.kernel.org>; Thu, 19 Nov 2026 08:23:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46F3F606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-7d2ccd3c7a2so705361137.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 19 Nov 2026 00:23:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795076624; x=1795681424;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+hfyVl1XUQA6cwLu2cPCDOrlTt5udZgDRMAPyOiNJi0=;
        b=bn8SsG2LNqFUukpwS85jksrf3YnjxJgpQ8oy5BA/RMtmNKk5X5guHxvM1DbqGFtgXF
         0i+KxLzKr2MgsGnU8Yuq8nIq9yJDi6DsbnEWwenW+iUhHMI456L4Ug8fsVB9T+Eobp8e
         RaTZPmtXhlOlbJLdLhXdbz4NkxlhHM54eZAEvRDAitrYJBYkQP7MJtsqXWiTlXfF6pOU
         hF0FIsiqqiBTl70tnrf7O8CLxPAJ5Z7w2q655ZgUv1hpqIWjWhEs5n78BUGXziRi945e
         hUYIwIC9CBQFOLxgM1XRve7T5NumjM95C5ddH1XLGIHx2jtUGxJXJ8Z/s/kwSeMrVKSN
         ZIBA==
X-Forwarded-Encrypted: i=1; AL+hErH/QJP2zZe98KNnDvhk9EeVBUFo3f+DYmhjwPEd9KTvzW5oiUGhmQAKJ9L786Lymc/KHxICFVurh2pSkdqDfOk2hw==@vger.kernel.org
X-Gm-Message-State: APuU4Z/D/pXHQbtV60UHbdIx9u3K4y+DGaYrBIlRPRg4CR87y3o0McjE
	aiAwOUq/EVSM7QswUkNflnxkqYku6+phX75JkFWDP+9uaPqkQLL9qXk9BSklndEn
X-Gm-Gg: AYBFou1qb80I7FiDaz3hWntFWLqOj2IxsbmO9XbQdMQaWDRqFqhwKGvZ1YV1ExQ+34x
	jk3FAJlHqLQhDMKRa/5NbdSNkEKhiK/+PN8IJ3VKTO2BBHErZ4rYqSofqOR0y2ED4oHlYzTtOvq
	oenThYiwpl0wQdyFfP77Djta0Vs872QIGe9CFt6Inqy4Sr9fuv7rzgPMMDiHTjpuggT0kqQfWwX
	nJlU2srAg+cNsd/iHHFzO7fxO8COh4YSK9SpGUryRRmB5/+TmEHlW3t3wEAKVYeIv8uZCcUtlS3
	E+c03bTgrKvuRsuQotUxOFIBkrZjF228eeMNa3jeuTxkGPttsktMoV+aAVG8rREEBov1ttFzkR+
	30KYFiuq8eIuP78IqGR6X+5Zam9LhqMUuGabY+FhcAJKnEc8M+kqTkC7jO20sBwTErr0DZPttpR
	3JHSgY3KSFEIeOqSIlZuslnHd//gG3SqKu58xE5fy+vTNLrXkyOg7AKfDtpm2leXv/gjDLgo3qk
	DI81u6mAEuOzBKYp/JLskmaETlGhCcdEiFQEDcugpFSVFrlmUOhUlmGkDAEVUqCGtqjNBzl5nRW
	dgEts5RqL4CJjeHG/QM3ALz5ud3OaEMoTc6LAWCr3/UjWjlA1HIqZlAvgQ1tnwfFIHs=
X-Received: by 2002:a05:6102:5802:b0:7ce:6288:eb0a with SMTP id ada2fe7eead31-7d6ba406ffemr1793027137.18.1795076624030;
        Thu, 19 Nov 2026 00:23:44 -0800 (PST)
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com. [209.85.217.44])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99e49c6299fsm3760259241.0.2026.11.19.00.23.43
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Nov 2026 00:23:43 -0800 (PST)
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-7777fa8f1ccso714900137.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 19 Nov 2026 00:23:43 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEKm5Q2405Dt8v+e1ljA7a5yS4nS9VAivAa4q0Ly9Y9Ud/mBy/F0DJwHFXhpK6zXE6bqNH1umZrYXHGMIByzl0wIw==@vger.kernel.org
X-Received: by 2002:a67:e113:0:b0:7d2:a019:b42a with SMTP id
 ada2fe7eead31-7d6ba48d83dmr1658750137.32.1795076623219; Thu, 19 Nov 2026
 00:23:43 -0800 (PST)
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261118214518.29317-1-ville.syrjala@linux.intel.com>
 <20261118214518.29317-21-ville.syrjala@linux.intel.com> <20261118221114.GI1923307@killaraus.ideasonboard.com>
 <av4nb98f3ewe2rV3@intel.com> <20261118223911.GJ1923307@killaraus.ideasonboard.com>
 <av4tQaL6caoqd2w8@intel.com> <CAMuHMdWSiwX6AoPoPwF4zrYpO8xdaG=aq7U2JG_RjyS-E5UtcQ@mail.gmail.com>
 <20261119081613.GO1923307@killaraus.ideasonboard.com>
In-Reply-To: <20261119081613.GO1923307@killaraus.ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 19 Nov 2026 09:23:32 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXvFVhYiT1CSHoe45tUkkDPz=pND6jc0CswQWF3agPC_g@mail.gmail.com>
X-Gm-Features: Aa3M54qDzVkUx71v61aMc9IrVxbyT9_EmyPnJjNSiSx7Z1-Yks0fKGnCa5fVWic
Message-ID: <CAMuHMdXvFVhYiT1CSHoe45tUkkDPz=pND6jc0CswQWF3agPC_g@mail.gmail.com>
Subject: Re: [PATCH v4 20/20] drm/rcar-du: Allow VSP and writeback build with COMPILE_TEST=y
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, 
	dri-devel@lists.freedesktop.org, 
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Laurent,

On Thu, 19 Nov 2026 at 09:16, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Thu, Nov 19, 2026 at 08:38:21AM +0100, Geert Uytterhoeven wrote:
> > On Wed, 18 Nov 2026 at 23:57, Ville Syrj=C3=A4l=C3=A4 wrote:
> > > On Thu, Nov 19, 2026 at 12:39:11AM +0200, Laurent Pinchart wrote:
> > > > On Thu, Nov 19, 2026 at 12:32:15AM +0200, Ville Syrj=C3=A4l=C3=A4 w=
rote:
> > > > > On Thu, Nov 19, 2026 at 12:11:14AM +0200, Laurent Pinchart wrote:
> > > > > > On Wed, Nov 18, 2026 at 11:45:17PM +0200, Ville Syrjala wrote:
> > > > > > > From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> > > > > > >
> > > > > > > Make DRM_RCAR_VSP selectable with COMPILE_TEST=3Dy, and enabl=
e the hidden
> > > > > > > DRM_RCAR_WRITEBACK option by default, so the VSP and writebac=
k code gets
> > > > > > > built for greater coverage. Builds fine on x86, x86_64, arm a=
nd arm64 at
> > > > > > > least.
> > > > > >
> > > > > > Let's see what build bots will report on more exotic architectu=
res. I
> > > > > > may volunteer you to send a fix if I'm too busy when the builde=
rs start
> > > > > > yelling :-)
> > > > > >
> > > > > > > Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.c=
om>
> > > > > > > Cc: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> > > > > > > Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> > > > > > > Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> > > > > > > Cc: Magnus Damm <magnus.damm@gmail.com>
> > > > > > > Cc: linux-renesas-soc@vger.kernel.org
> > > > > > > Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.i=
ntel.com>
> > > > > > > ---
> > > > > > >  drivers/gpu/drm/renesas/rcar-du/Kconfig | 4 ++--
> > > > > > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > > > > > >
> > > > > > > diff --git a/drivers/gpu/drm/renesas/rcar-du/Kconfig b/driver=
s/gpu/drm/renesas/rcar-du/Kconfig
> > > > > > > index 80bd770ae0f6..5394f131c58f 100644
> > > > > > > --- a/drivers/gpu/drm/renesas/rcar-du/Kconfig
> > > > > > > +++ b/drivers/gpu/drm/renesas/rcar-du/Kconfig
> > > > > > > @@ -76,7 +76,7 @@ config DRM_RCAR_MIPI_DSI
> > > > > > >         select RESET_CONTROLLER
> > > > > > >
> > > > > > >  config DRM_RCAR_VSP
> > > > > > > -       bool "R-Car DU VSP Compositor Support" if ARM
> > > > > > > +       bool "R-Car DU VSP Compositor Support" if ARM || COMP=
ILE_TEST
> > > > > >
> > > > > > This will make it possible to disable the option when ARM64 &&
> > > > > > COMPILE_TEST, which will break operation on Gen3 and up. It wou=
ld be
> > > > > > best to avoid that.
> > > > >
> > > > > Break operation, as in when running on real hardware?
> > > > > People actually do that with COMPILE_TEST=3Dy kernels?
> >
> > COMPILE_TEST=3Dy kernels should still work.
> >
> > > > Hopefully not in production, but that may be the case during develo=
pment
> > > > (I don't though, there are enough kernel options to deal with witho=
ut
> > > > COMPILE_TEST).
> > > >
> > > > This should do:
> > > >
> > > >       bool "R-Car DU VSP Compositor Support" if ARM || (COMPILE_TES=
T && !ARM64)
> > > >
> > > > (untested though). Do you think it brings too much complexity ?
> > >
> > > Doesn't bother me.
> >
> > It does bother me, as it breaks the safeguards encoded in Kconfig rules=
.
> > I think it would be better if DRM_RCAR_DU would select DRM_RCAR_VSP
> > if ARM64, so DRM_RCAR_VSP cannot be disabled where it is needed.
>
> That's possibly an option too. But does
>
>         bool "R-Car DU VSP Compositor Support" if ARM || (COMPILE_TEST &&=
 !ARM64)
>
> break the safeguard ?

No it does not. But it is more complicated and less readable.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
