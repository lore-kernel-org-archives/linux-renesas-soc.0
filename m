Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795073915;
	b=N0noIg1bjxsOTUv0FZzmMO0sWT+F/2YwLvC118z9/+jZt6+hLJQbKccUDlx75tCEYWYg
	 9sSXQz5W6grXXOt13tmKPf3EU6WZ/c7v13o1voakoCMLBZ7D5cMQY34yg47AVty1jn0Fg
	 6aDNCRjm6jkINW3/5T0maLywOp5RvRE41DVxzHdl4H50FdwwykwfZoJ18GZvarY9eiUc6
	 42M2axufGsMFpg/iEncxGfh+L13ewhqFQ6JaSeUbeENR1HQE2WQSRln8DhOTRXfUK7RMN
	 DqmeyFt7I56m/CvxG7t6c6LBfH5gOxLdHGWlp/WUdbLGWU+tOpOIODFOCQ8R6bHXqGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795073915;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=k0+ZWXQWiknYSqpkTHhzEE+AHvAYHvT+Lzy36NlaabQ=;
	b=oNDKjmfKrrxPmCzR0OUcIzEZEEMvbnNXp9Cdu6rl7ZW7+rx1THHpQ+LW6yaq+9mVnuR1
	 K5lvjrKxv7NmXxJbdOwAjW2pNA/XIDAlgrsq4dmQLjC6dGW3+tiuMoTjgUjNdkLKS827X
	 iMuw+gQkgTHS3SahvVWldTaJuf6T00vyvznoZqvJWNeXBxCa/OtWN3gEKEW/LYXFE0ALz
	 +W4m8gqGsKhXH7hKIcaFw5A+G0Cl00dsetcZQ3drB8xOWgW1litSL33gToCnD2cG4URtM
	 r+Ot3ayoGVGj1q0/PiMPPCUmYw2q1VlqKY/Hz1lKy3UATaFspwM6mQlRPHyeDqglJSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.222.52
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 788A2606A324
	for <linux-renesas-soc@vger.kernel.org>; Thu, 19 Nov 2026 07:38:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 788A2606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-9907a58f14dso568849241.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 18 Nov 2026 23:38:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795073914; x=1795678714;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k0+ZWXQWiknYSqpkTHhzEE+AHvAYHvT+Lzy36NlaabQ=;
        b=xpM9n1tyP0a8P4RtV+HBdTNTPQgkLhj/UgCuBmgAZKVQ6WwSN96DXSO6zuTULP1j2t
         CDE2QBFpvCD3DVtR5+2t/U34s8I7Ya4BocpmrT8QvpjROlJ2aOmdfSEFw+a0rmQq3kAz
         A2ihCo7dSAx5ABLMnwP3E61RSNEpaQ7yzRRfSKDCpMxXwdUDGPIhbhNa5KZNyokk6vKd
         HPi0QaSamWLk9CMLAZW839NrRkw65FzbJ7r/jHRb9bB/+2kFADV7Jam82JigH45TRLZ2
         JUkcYFxFQKbjZ+PRDeO0y2M6yEq/5tPYFjseon2GT01XdWPadzwkjWbjPXw5HhnSaFw1
         l4Kg==
X-Forwarded-Encrypted: i=1; AL+hErERPigREu4M7Ut7r8wf06j7iVk4BpvMxaHOQTasDjHw11JOpD+f3hkKtJKBYLWHhph95ThYb8qLWo/5cI05jCJpsg==@vger.kernel.org
X-Gm-Message-State: APuU4Z9ImSpCo3SWbiiSd1ohGGKZJRzKvljkmy1NlRP6DA386jlWSexw
	IG6C1YCnNmJJIiK+sd/Iiq7/jjy+ndX32l3fhbClZ+oYwM7eW87KmqbxCuj5nz5Y
X-Gm-Gg: AYBFou0m6bwB2289XxnXH1dRGRak7jzGz4rINb3vWqg8Bd/A1U6I4Y71Lnq34g/fVqK
	TUUwZXMizN0TktRxvlD/GA1pNyK/n0OVkrWwlEQ+F26msk6mfG8dDkFChi4w9oAnhXqTVnfdRNf
	lPdUFD5+98r1BhVCY0rS92yN6WIHGlfKTCdRPvjb9dLqCc2v0sKqqhmUMl+pK4mGhieXbjoAhls
	Cyr6RsDc+RtbERg/lHE6cHUF16mFpOMS0NtUuq3Jx6GtcU2zAWH9LhSkBsdLOr2ngxYtagW3W99
	WCOAYgrhY2+GXNgHiZY+z/6mp4osA15DMdUM9oVEBVW0bxtVqZ31TsBbJzWDhHoljX0hChuvxhc
	HY2j2aDzfVas87Py/zK9t9PYoFnUFkg5JQkU/ztSxCYinjdg0nVx40ZaTt4W7sFpQcmYLulE8gz
	IrrDMi1mSxeFZTdPCP9VJPGt52XSVNF1OARUG4yOowuOoRxulEPTPzTGvwRjNbbcKM+jLnmbl73
	LSVHM/Vp0p9DGRifcR+8OiHrCZh7v3WVBE6VkbVyr5Q2vFwXpVV+pDzbDSzNbzW7m7LSd60vfj8
	ZJWFUeFXaVnFM+6yFzB1F330PAzjPKHpg3rnkhSNJbMw82hXupnKFmqenyWMpAtyGBtKBGHKjOo
	gpQvJvbXGXhnq
X-Received: by 2002:a05:6102:578b:b0:7cc:ccb:ce68 with SMTP id ada2fe7eead31-7d6ba493db8mr2001087137.29.1795073914299;
        Wed, 18 Nov 2026 23:38:34 -0800 (PST)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com. [209.85.217.47])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99e4a1b61eesm3822661241.3.2026.11.18.23.38.33
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 23:38:34 -0800 (PST)
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-7cc2bb73cd9so684830137.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 18 Nov 2026 23:38:33 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGzvocubsdTOVV2Odf7OB28SFxiKrFHcHgJ4txUhxK0BwC3RWupix4AiWroQWJdYRvJZLxV4DP7nCDv8M+9FAnClA==@vger.kernel.org
X-Received: by 2002:a05:6102:3f9f:b0:7d0:6db8:dc33 with SMTP id
 ada2fe7eead31-7d6ba22ce53mr2119889137.2.1795073913387; Wed, 18 Nov 2026
 23:38:33 -0800 (PST)
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
 <av4tQaL6caoqd2w8@intel.com>
In-Reply-To: <av4tQaL6caoqd2w8@intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 19 Nov 2026 08:38:21 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWSiwX6AoPoPwF4zrYpO8xdaG=aq7U2JG_RjyS-E5UtcQ@mail.gmail.com>
X-Gm-Features: Aa3M54pIjw8Q6yVuzFTv0f6jMNRzbaN6MrjfovuH5QzOAoOlJRGM9JUOWvoBvC0
Message-ID: <CAMuHMdWSiwX6AoPoPwF4zrYpO8xdaG=aq7U2JG_RjyS-E5UtcQ@mail.gmail.com>
Subject: Re: [PATCH v4 20/20] drm/rcar-du: Allow VSP and writeback build with COMPILE_TEST=y
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, dri-devel@lists.freedesktop.org, 
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 18 Nov 2026 at 23:57, Ville Syrj=C3=A4l=C3=A4
<ville.syrjala@linux.intel.com> wrote:
> On Thu, Nov 19, 2026 at 12:39:11AM +0200, Laurent Pinchart wrote:
> > On Thu, Nov 19, 2026 at 12:32:15AM +0200, Ville Syrj=C3=A4l=C3=A4 wrote=
:
> > > On Thu, Nov 19, 2026 at 12:11:14AM +0200, Laurent Pinchart wrote:
> > > > On Wed, Nov 18, 2026 at 11:45:17PM +0200, Ville Syrjala wrote:
> > > > > From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> > > > >
> > > > > Make DRM_RCAR_VSP selectable with COMPILE_TEST=3Dy, and enable th=
e hidden
> > > > > DRM_RCAR_WRITEBACK option by default, so the VSP and writeback co=
de gets
> > > > > built for greater coverage. Builds fine on x86, x86_64, arm and a=
rm64 at
> > > > > least.
> > > >
> > > > Let's see what build bots will report on more exotic architectures.=
 I
> > > > may volunteer you to send a fix if I'm too busy when the builders s=
tart
> > > > yelling :-)
> > > >
> > > > > Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > > > > Cc: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> > > > > Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> > > > > Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> > > > > Cc: Magnus Damm <magnus.damm@gmail.com>
> > > > > Cc: linux-renesas-soc@vger.kernel.org
> > > > > Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel=
.com>
> > > > > ---
> > > > >  drivers/gpu/drm/renesas/rcar-du/Kconfig | 4 ++--
> > > > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > > > >
> > > > > diff --git a/drivers/gpu/drm/renesas/rcar-du/Kconfig b/drivers/gp=
u/drm/renesas/rcar-du/Kconfig
> > > > > index 80bd770ae0f6..5394f131c58f 100644
> > > > > --- a/drivers/gpu/drm/renesas/rcar-du/Kconfig
> > > > > +++ b/drivers/gpu/drm/renesas/rcar-du/Kconfig
> > > > > @@ -76,7 +76,7 @@ config DRM_RCAR_MIPI_DSI
> > > > >         select RESET_CONTROLLER
> > > > >
> > > > >  config DRM_RCAR_VSP
> > > > > -       bool "R-Car DU VSP Compositor Support" if ARM
> > > > > +       bool "R-Car DU VSP Compositor Support" if ARM || COMPILE_=
TEST
> > > >
> > > > This will make it possible to disable the option when ARM64 &&
> > > > COMPILE_TEST, which will break operation on Gen3 and up. It would b=
e
> > > > best to avoid that.
> > >
> > > Break operation, as in when running on real hardware?
> > > People actually do that with COMPILE_TEST=3Dy kernels?

COMPILE_TEST=3Dy kernels should still work.

> > Hopefully not in production, but that may be the case during developmen=
t
> > (I don't though, there are enough kernel options to deal with without
> > COMPILE_TEST).
> >
> > This should do:
> >
> >       bool "R-Car DU VSP Compositor Support" if ARM || (COMPILE_TEST &&=
 !ARM64)
> >
> > (untested though). Do you think it brings too much complexity ?
>
> Doesn't bother me.

It does bother me, as it breaks the safeguards encoded in Kconfig rules.
I think it would be better if DRM_RCAR_DU would select DRM_RCAR_VSP
if ARM64, so DRM_RCAR_VSP cannot be disabled where it is needed.

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
