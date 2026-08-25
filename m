Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21B8A47A0D7
	for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Aug 2026 13:26:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787664389; cv=none; b=kcuItfghBvuym3cPddhyAb+cYm/a4gBvN4Si2iQIqbiQhuc5knNAwWidKLtJ0/MLLiHwP1kmAjHL1mE+aI30keI7wDEol3T2URMNSZIB0wUaf+yzC8t6Kn+G8e2bHt+jxYFp2EFZCxUUrKEfRx4VmQwYH8GCjzCk1GYg6f1jW50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787664389; c=relaxed/simple;
	bh=7k/DsBnev/NpUwQENuaPfi7YDsBm/CoemCRBs3TwNFg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XQVdEafI2R7a5GK1Ct5ltIcTvDfmQDM7EcWlPk707uMq5EBltyeDE6saxNm+2curlHZfJoLmKt5ULaFlCf5fqR5seHHmYigzx6N67Cwadd9KOCwW4rDQHrz3HCs+pPXSnLTRGjrH1vqhWjTm51fAdSVc9mvdE0UZBgpgpB18ZRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6a378f90555so7525901a12.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Aug 2026 06:26:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787664369; x=1788269169;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=XvnEH8RyPx/YIkplbykqCJEgDyu56g+0LDhL+b1yTf0=;
        b=VkrUIUtmMq42N2vWOdGGQb6ix78WcqLSBuAIpy6dBa58B5N+Q8ohl12H7fxFuYfjG4
         Bhx8l932bnL8OmpN0InrQTpkOMqNtLhs+pmqO6asjAzYMaeazJg4dYXXMV2DdqvvFFhu
         4PNWFVkh/l0iQR6k6AfYuPyUuAb4BVRogTbYuEvk7q2LsVubzCWHZEdF5qzc6zf0TFtz
         VyD13Fq71Ix6Y8dOP062l+8+fXszNFAYXAViDdcZ9StG8lbUpJGC/VlWP7/NlkFHZaPh
         0GyZaUgPHvIqaSAFCMcMgzeE5N116ebqqnhaFzyXkTMvmeoBgRM1uW0SQPe+SUJ3I3mw
         wDbg==
X-Forwarded-Encrypted: i=1; AHgh+RoRoCstMqiej9JiHGFF8FAm/rd4fZFPkMeAQvamr8Jg3+xYkENGszfdiFx5UktRYYFUlT7TSl7DlWYht+gGG4I0pg==@vger.kernel.org
X-Gm-Message-State: AFuF++n0z+21M+kAqPAPLo8Q/dOM8NTlcpcagsixplS9xWUqnAWbNb5S
	RkgMw8X0JyROdxZRU4TFW8o4m2RGwamof0jyDmxVZXwuNQUiWOS+ph1kSAib5wAvfiU=
X-Gm-Gg: AR+sD12mk6WWaEoX8sFjd6doRVpe4MQf7YbafFZkToY9rwJQmwiv42V6an4h1Bs5K8I
	mfDAspGGEcApiNB4HZaWPF0JEgH/HqgFCiiS8YSN07gZ1HvGuQho9fYifrjTPg8GvEXA3i6sJlL
	/iaP9DwlTjItx8icED9Ad6LyVJf3apBLukLxjWcA6bX5uuOvPp+z24MYh/ux7WVz1coSpvz5eJX
	AOsMSNEIbBeYeGJeUMNFiLm3/+wyoT2gCxIhyYprAU43de3R94vcCDH9EwDG/KHGvebUUzfLHBr
	p10e6n6W0Aoq7ku8ilz7vmYRWJWPcr+FFLpvyLucdZ1uZvixSpvIq0RFgqpss/8hOAokoUcsMhV
	IIJ7N9vDE7u0EiBljpgaHfsAq662dl6VT/g2X/jpCNn/hlVUDX6sh/POYGj4i+UexQY5jHYZZKb
	fvBIvnzEIQdRf3frecYSrZZI8hPHPaqW93TgKoZgjJCs+tjdeJUKLx2GU7BUofYliKl0S28lDFD
	bKPlEPjvEHm2o7t8wmrbfuu7A==
X-Received: by 2002:a05:6402:3888:b0:6a0:927e:39e2 with SMTP id 4fb4d7f45d1cf-6a42f1b7471mr42503382a12.5.1787664368989;
        Tue, 25 Aug 2026 06:26:08 -0700 (PDT)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com. [209.85.218.42])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a59e1d741asm13992531a12.27.2026.08.25.06.26.04
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Aug 2026 06:26:04 -0700 (PDT)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c20fb91ed0fso737714566b.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Aug 2026 06:26:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RomIZs9fdwDbL2tRzEnX8XkBKiZ56hW/m/X0fJEH5KTI0AlNjI/omo/8MMkc3ydiQGjH/LYL3Snbyb51xYOtPDBkA==@vger.kernel.org
X-Received: by 2002:a17:907:a4cb:b0:c25:23d:5295 with SMTP id
 a640c23a62f3a-c25023d5366mr258635866b.17.1787664363766; Tue, 25 Aug 2026
 06:26:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260520131206.932050-1-claudiu.beznea@kernel.org>
 <20260520131206.932050-4-claudiu.beznea@kernel.org> <ahhMX0hdr43K9eLa@shikoro>
In-Reply-To: <ahhMX0hdr43K9eLa@shikoro>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 25 Aug 2026 15:25:50 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUtGizx1R05Q9rdV7TDoqSP_ydN=k032uDN1QuHETxBYQ@mail.gmail.com>
X-Gm-Features: AcwNN1XrdhXunWbM84RFR619swSSfNC2ju8fMMD8rs7CEKU82Z0-godPeY2rQF4
Message-ID: <CAMuHMdUtGizx1R05Q9rdV7TDoqSP_ydN=k032uDN1QuHETxBYQ@mail.gmail.com>
Subject: Re: [PATCH 3/4] i2c: riic: Drop the space in front of the "out" goto label
To: Wolfram Sang <wsa@sang-engineering.com>
Cc: Claudiu Beznea <claudiu.beznea@kernel.org>, chris.brandt@renesas.com, 
	andi.shyti@kernel.org, claudiu.beznea@tuxon.dev, 
	linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Wolfram,

On Thu, 28 May 2026 at 16:10, Wolfram Sang <wsa@sang-engineering.com> wrote:
> On Wed, May 20, 2026 at 04:12:05PM +0300, Claudiu Beznea wrote:
> > From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> >
> > Drop the space in front of the "out" goto label from riic_xfer() to follow
> > the pattern used in tree.
>
> Time for this quote again :)
>
> > > "> It is generally accepted to indent labels with a single space. This
> > >  > avoids breaking the -p option of diff."
>
> And yeah, I have been bitten by that.

Looks like "git diff" improved upon that ;-)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
