Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD60E39A7E7
	for <linux-renesas-soc@vger.kernel.org>; Tue,  8 Sep 2026 07:38:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788853135; cv=none; b=r8e+aZD/dh2in1sb382Lw0nN5OwW+2NOyZf40WhUXoGz9xHHZNsZ++u/nEBJYmGD4WOcsBhxkxXTvKenVRHi6BSVVLHL9Ktm/P66UXMNWc++41Q+Q7FX7iZ6YILiiPqEMtYR+lcxWtcgXCqTwMpvqdYxR0y6uDaL0B87JUUiAPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788853135; c=relaxed/simple;
	bh=6Zc6vX1bU73eq1imPj+MTEbo+7J7RWbcsZWKEYMmjQg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jG2sPI6EHwsKSOOfImc63hFk3IGZYFrgnlRBYI53W+/oeAU5iLx3sF3sNV/QX1j1YgHUbzYYrRNJa5ubSdhhf39bXafU+9/6c287inve2okggAS/aDfHY2F5WYrwXwVzL3JpO+KJV1QPdx6YnCnbWXyOSoQAVh3jXBjPq5/1aUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-783fffcfb96so3296464137.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 08 Sep 2026 00:38:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788853132; x=1789457932;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9FJoKkivoTNtHINOjagJJ4U0TVNQrepQ/joiDIuSwkg=;
        b=c+StMZP5yy57OOiHL8M8+jYqqmK/igohbEogNkh4nUrKUfqw04uzrAhemyg29Mbf59
         cveccRQMPcz3XjeuJJZThMAtf5sCi2dRfnry9q6hTKyN/AwlwqSj7ZjUT8wex0jjaTDZ
         ry2/Bx6WQLATb4pCZOD/3ZQ76x3NY5RjBpr4FLIDvniefr9sd5aZCInbhvrItHHA7t+v
         CHeOBNV3rbBicp6zIcWCeng57EbnCEU/Pgy6c5xDibcj6DBhN+SkyYkcVMVmgTc5FufH
         S4HgMysQInyaQkDS+QKoC/H8V+M3IVf/8khfU+rqybP8m9/zvb1owb+yp1Uxf91wX1IS
         w31Q==
X-Forwarded-Encrypted: i=1; AKwUvBxLhkNvFuzaG0ag3fuZAS+tKTIPxY+Jirm/B013OQWmvyWlVO7TdU18HEM3JXukf7i8Jjof1IsYAU0s0ZfQelL5oQ==@vger.kernel.org
X-Gm-Message-State: AFuF++nD5mrdvUhESm3MxCmy5n+u9Seb1GzfVzPHyRioFvtl1j86dgbj
	012cmwgHM1PMvlYjPxkaZjeMyRHDS+sAMcS3HFA2IEyGXlhbR/CQ2FGMhot0IoIM
X-Gm-Gg: AYBFou3sstew6MSIaPJd384LsaOUtnPs5/ogcS+uAt9hkU4eOlxDS0O824qHC1ToVtB
	oWlnrxQZzuP5IgGKA+Zt2jEoke1nxj4s1oZnEYLrYMUwZilX2xKBsPiBpqNvU8kxYV/D78KSLC1
	rmGAUNatAOE0PA/Vm8AK8zJ+eiL3zdkQYlPMvSzmVx9WvA3zp0SJ8uDG01pxt/RUX6SQmKAx5YL
	sjLZaPpc88ljYyNifoSOvWrThMRbN0QihJInZV8R983qfDz/vsSQTvP4RJ2QBlsrOV0/Zk09R+U
	KFtgv6zhHkCwR5DrF+3QBAYvmpvYO5QobN6SSfPnrslonTpo4mFXm0+KmSsHYExEwzTQwJSfRSw
	1xBzgLIM3z2e21Zf41YOg4A08ueEU24JNhXll9C1N0w3byEY7uVXSqeD0feMTKoPtSgVkVfSvLA
	Gsk+VHoHVPvuMzYhb+vT5P+oYCtgkUQxldmjZL5MtrsHEDzk0CUct7eYWsQdUjmG8hNaP/PBJrs
	xsD38G3sHfwuhdnJGSVzunvhg==
X-Received: by 2002:a05:6102:80a3:b0:77d:9fe9:1716 with SMTP id ada2fe7eead31-78a4a6e83e9mr14376965137.2.1788853132548;
        Tue, 08 Sep 2026 00:38:52 -0700 (PDT)
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com. [209.85.222.50])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-98097de57d4sm7754718241.10.2026.09.08.00.38.52
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 00:38:52 -0700 (PDT)
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-97c7afa485bso2439772241.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 08 Sep 2026 00:38:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwVoWNM6N2byioOZXjj/qTDFRwjrjqHJDMAAvjuS13pNXN3npMY5hez/UeFEX387RYpQ+6ytFOwbjZ4fqaM49PcLA==@vger.kernel.org
X-Received: by 2002:a05:6102:b02:b0:786:c86c:4f5e with SMTP id
 ada2fe7eead31-78a4a6e7023mr12540904137.3.1788853131839; Tue, 08 Sep 2026
 00:38:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <2a759a486337e4cc8156bc94079471a6552faefc.1787669487.git.geert+renesas@glider.be>
 <CA+V-a8uXz6ehq3Mdgri0zT9we7kE+=-XZjahfVg3BBu4NGxh2g@mail.gmail.com>
In-Reply-To: <CA+V-a8uXz6ehq3Mdgri0zT9we7kE+=-XZjahfVg3BBu4NGxh2g@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 8 Sep 2026 09:38:40 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVFwTQkdWZ0M2fWE3JCKT9fJ52roWBec8FK-=bm=BoWrg@mail.gmail.com>
X-Gm-Features: AcwNN1W_wiXo_u_6vCxRFTrWJy-fQIHFj_Po8KOr7IuAmZBSsWV3hZnj2lA4-7s
Message-ID: <CAMuHMdVFwTQkdWZ0M2fWE3JCKT9fJ52roWBec8FK-=bm=BoWrg@mail.gmail.com>
Subject: Re: [PATCH/RFT] arm64: dts: renesas: r9a09g047e57-smarc: Update CAN transceivers
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 7 Sept 2026 at 20:46, Lad, Prabhakar <prabhakar.csengg@gmail.com> w=
rote:
> On Tue, Aug 25, 2026 at 3:57=E2=80=AFPM Geert Uytterhoeven
> <geert+renesas@glider.be> wrote:
> > The dual-channel TCAN1046V-Q1 CAN Transceiver on the RZ/G3E SMARC EVK i=
s
> > currently modelled as two TCAN1042 instances.  Improve hardware
> > description by describing the actual transceiver.
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> > Compile-tested only due to lack of hardware.
> >
> > At least the TI AM68 SK DTS should be updated, too.
> > There may be others ("git grep -wc ti,tcan1042 | grep -v :1$").
> > ---
> >  .../boot/dts/renesas/r9a09g047e57-smarc.dts   | 25 +++++++++++--------
> >  .../boot/dts/renesas/renesas-smarc2.dtsi      | 13 +++-------
> >  2 files changed, 17 insertions(+), 21 deletions(-)
> >
> Apart from the sysfs file name changes everything works as expected.
>
> Old path                                               New path
> /sys/class/phy/phy-can-phy0.0            /sys/class/phy/phy-can-phy.0
> /sys/class/phy/phy-can-phy1.1            /sys/class/phy/phy-can-phy.1
>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Tested-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks, will queue in renesas-devel for v7.4.

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
