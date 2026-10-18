Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 152794C6F04
	for <linux-renesas-soc@vger.kernel.org>; Sun, 18 Oct 2026 13:58:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792331893; cv=none; b=S8SPZRjtQgnS3tzupyTdewBtJdKEyEw90tvD6edwmAtnrrvZLrN6/71G2W+5RjCnHenCZ3s554kpcT9inoR6jWBavtG5QHQtd33CEd4BWM3Kc5dcgp4oswSyEk9/XoID40d0Y24M7eh6KqZ9Xw+L1VAYpN8gfc6S97ifphT0ZeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792331893; c=relaxed/simple;
	bh=rCFulCS196Fw/DBDyF9OMjFHIxiu7hy/WMzgUHoLoLs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pJbqmmZuP8hXF/NLGq7PKXzYmBFXKN/10yaNcK8DtpBta1qDs7O6pjdg8wFLnqrg9BHTNokMj+3MRZpYwSGuUBGRfnrQImXuZab7+8cGtUyCG5rWKqJdpiWoSd43BQrCIrNptZyEy4Zsjcx6DgahJ+SBT9BkI8AMv9CBcklj7cg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2db80fcdf8bso6869175ad.2
        for <linux-renesas-soc@vger.kernel.org>; Sun, 18 Oct 2026 06:58:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792331891; x=1792936691;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=fhGyumamsbJwvfAtfGydBWyfBrT9VHxtfq0yzwmUVgA=;
        b=jZQ+IZzL75YKOnSeFuRIpsktmfyQfmz49aHkHRxVUvrmubc0OzVTGDKf/058JHxzN3
         OZTOYoPwoA8wHeUdlwb3ZbGKw1bEq4xXObRmGkvVyIuINCmUY8nxvdkJypZC6dVbZvOF
         PWkh3WjdZqjWVEGlsMs+ddJk7P9O7ipZIZ9TepQjmQOUbQyy0/xnZ+Sw42YEHzWfZlIH
         BtgK/QMouzwxbHjCuMUTzXcgIQ1JEpcKU9XK6kDLoSyM+UQawYAexAEXjPmiuJmoUKR/
         BpKTejQCbSTMOt2EtdDBzKiQezWM6PccD4usb17zaP+7Q0748mbX4DexzmsQ3HGg6rFT
         r9XA==
X-Forwarded-Encrypted: i=1; AKwUvBzsriL0knJs+YrntvpQk7FeHEubFQN/K+SH5tPbiotrh461MrpKsVAwzrhRtUmaaNjYlP3xWkN+H+kDO9PxrO0c7g==@vger.kernel.org
X-Gm-Message-State: AFq9FYJPp3UWgKtcmcQPCY4gDEAdRVg4g6NVq3BfGgKoQZQI/ViHp1wx
	lOWjznviL2H6KOvY8w8NVE2AVFi1FWtuyiCQAwzhhbh2dLkH6+9EHmqoLp8QJ+cv
X-Gm-Gg: AYBFou0TGEmmJMQjTlMou2oAh8GTnduG+5xLegc9GOHAUKTpS9q/WpQo1xODdhxBtVd
	FCTY3hEBLA7UNzUTVIVz6GZp72rMdayCyzXjnDsYtwwKgRgCJYlqFZ3DIICeBsING8HCKSZEhVW
	fu/BXLID3acOolLy7N2x0ya535LD/3NNyCexSjHVNUEpX02Ep0jfckyPi1VZhSYAXanOWqLcJyL
	up4/pofw7gVDYtuSY3MgcsGu73Wg6uE4lNE95XmuQFn+OH8EuoOgj3Yw9Ywv/ck0JrAWFJKF2s5
	5CcZ7zxf9L3xoi4XSig77LcO5qhSDfdpZ4QUMoWICp8XsvwAnG/Ze6UQ/J6xhKYN9sKWW76bSH7
	5HI2hHY4xmhqN7G4ZHymzMTR9+nZFR2gnVnkogQtfBScQmPja4XW0716VkQn5ueUmcGHhkXIJeP
	UU7ZJRIKobL1KkWuVcgDjNaWA+aFlIDTiR6BmunK8oATToG5lefy1GmFInCk2kKJBkh7AVCwChr
	W360KzarEWAGlHuWEAgKKOo0l545gDYOLk=
X-Received: by 2002:a17:90b:3889:b0:3ac:17c:6e85 with SMTP id 98e67ed59e1d1-3acef0ffa0fmr4262672a91.47.1792331891275;
        Sun, 18 Oct 2026 06:58:11 -0700 (PDT)
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com. [74.125.82.43])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac94798212sm16944055a91.14.2026.10.18.06.58.10
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 Oct 2026 06:58:10 -0700 (PDT)
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-15dd124bbe7so2492122c88.1
        for <linux-renesas-soc@vger.kernel.org>; Sun, 18 Oct 2026 06:58:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBw8L/SDIDmNjS6xoNdEnomMMZqlS/EOXLw3XvbglUCrqAxQa8bjiERzPZ0JI21hTrahaXCoRDDjN1AgXQwjPSQLUw==@vger.kernel.org
X-Received: by 2002:a05:6102:5249:b0:7cc:2a3c:9a33 with SMTP id
 ada2fe7eead31-7cc36b49079mr1291606137.34.1792331517781; Sun, 18 Oct 2026
 06:51:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1792163045.git.geert+renesas@glider.be> <1d7da50cfb58232c6dd4c4afefb938fd7e62fdcd.1792163045.git.geert+renesas@glider.be>
 <51d8ba05-76e5-45ab-91da-3c6cb02505d7@mailbox.org>
In-Reply-To: <51d8ba05-76e5-45ab-91da-3c6cb02505d7@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sun, 18 Oct 2026 15:51:45 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVzX8fd4NDQi8ow0m+48g8p-LBHMysFi+fOqp1oDtT8LQ@mail.gmail.com>
X-Gm-Features: AclHuK8HjL2MgNJEhgQ8UPYzZV_qfVLea-QA-Rw_khapKdsDEf1HaCakMPT5y5o
Message-ID: <CAMuHMdVzX8fd4NDQi8ow0m+48g8p-LBHMysFi+fOqp1oDtT8LQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/8] clk: renesas: r8a78000: Add clk_hw to clk_map
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Ulf Hansson <ulfh@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Kevin Hilman <khilman@baylibre.com>, 
	Vinod Koul <vkoul@kernel.org>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	=?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>, 
	Sudeep Holla <sudeep.holla@kernel.org>, Cristian Marussi <cristian.marussi@arm.com>, 
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Marek,

On Sat, 17 Oct 2026 at 19:34, Marek Vasut <marek.vasut@mailbox.org> wrote:
> On 10/16/26 5:55 PM, Geert Uytterhoeven wrote:
>
> [...]
>
> >   static int r8a78000_cpg_probe(struct platform_device *pdev)
> >   {
> >       struct device *dev = &pdev->dev;
> >       struct r8a78000_cpg_priv *priv;
> > -     const struct clk_map *map;
> > -     int ret;
> > +     const struct clk_map_in *map;
>
> Super-nitpick, use reverse xmas tree ordering here if there will be V5.

I believe that's already the case. What am I missing?

>
> >       map = of_device_get_match_data(dev);
> >       if (!map)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
