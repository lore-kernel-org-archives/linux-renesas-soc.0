Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8272218ADD
	for <linux-renesas-soc@vger.kernel.org>; Fri,  4 Sep 2026 11:16:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788520621; cv=none; b=gKHK2NIgXHgmlv39ArDDbjnQP/0QM0n0pEtL23afPnR2g/XpMX7tYM4tyQqDvHOnrHCF1fXCeng59Px/SsUn+A1g6RGVCQ/9kUazCZUyvJqWyoaYTM95bXTf9hwTJMms2s7S6jGQ6Xjxi2RPP+vvtyaU//hHgejzmqgkCF4e7rA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788520621; c=relaxed/simple;
	bh=V06IaIi4jTJzj1JK9gqz8ZBxdNpdoXx4g6Xhk1QdB8w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Acc9re+VuLlJ5o7S+UCGnHfKQfMPIi7jepQd8djQ7JJJ+UUKyh1Fc6sCOHwd97MfCxPYPscl8H38HercfPe1T4hE2twtjCeJrwOZuQaqypcwDakjBXxFKDk4Mo25fNUUJpy3fLk5hatk4Bj1a5S/9odXeZZkrGCiyn0W0eXmzBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-5bf9466867cso377419e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 04 Sep 2026 04:16:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788520618; x=1789125418;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bKz0EbNXKgkRmHwAjHcE4su/TyTn7raXYOe8ludN9rM=;
        b=VWeehgfK5hFuPPigN8lr1AFQvgt+CAU5NNrjevivTrQ1efaSBVqoWnE/BOG6q2SCAG
         a0/EELoV/5/SNz3NCVzt8Uop37+tmZGdzRIjeVXCKNUA9KWE5Gg1NIjIH6xl5S1el4jJ
         zTQ9e/tZYJSSW+6MaFdfe29a4SEE7ICOpeT2UP9h2c91eJ0Rw/6Dt87qb10YIThVmjEj
         +agq5BKhQ7mR/rQmUrNBkThGkGVIJl9/1B4v+dGs8S3xmafTIQdPBZBaQGxlTp38a82Z
         +q6Mqf8lSXbSCHAVFYP83o9S+PlMhgL6wGgAX5ICDemfNMAeXyv2GRhNjoZwhxGgjmxQ
         upNw==
X-Forwarded-Encrypted: i=1; AKwUvBxPQJDr3rBGwdcxKq5Dqnjhp7dVNZ/e7UMSzONIsiM4h3NcQ8R9PgsUHO/UO/1YisrAR/Qi9Yap+s2D9GMzn0wQKw==@vger.kernel.org
X-Gm-Message-State: AFuF++mh92skU29uQgMSdj0G19HH+ofTTwC4L76LbiCu2xD8Vd5O/swt
	JU0h0d2ywRIqQHobH5gtSetU61Mqk2wA+qwd8fxkDMkZ1SLbiNEtOFYItaKpBE+8wWI=
X-Gm-Gg: AYBFou17M1m6ah+xPkvmuAk4gJxgJRyfB82WbM4BTJ5700+s+KXCBhWrvUf806ZPor+
	3siNnwaZP0etHHysQ7JrCCwQ4G4hyzHgVPo65q8hD6s4/3yIssYAFnZ+ycIc37XDZf8pRlEH+YI
	Uy1YhpBw5QJ1nIOEffjdGcsaUtfdCbP5XbbBaDfWLPVdhKBpdSpssUUgsvhK0ohYemqxd6V9CpK
	Olxkljflr6i8lWtWng0ErXtLg90jH1RAdCertEJLuueU9uoFO2H9aSYFtegF1upApWXdv7Qr6UH
	LEd+Bj22ubidrXZJDibI406EylzrlAD+wTBOb8koQ3dw6JflwtZc4S6dJQh+VCni+tQFIPM8YH/
	h++GHysbtAGdk8xFcGa1zodPcn++Po+yg6I6MLqVj9H1BoQhaoM7L5LuOhOdrCb4WCvaKILhtVU
	jsbGzaQdHoEm3K1d5xLHeJl6ik3lzQO7wu5ROhNCOwNmuBImM1seuAvLzU3tY+9Ai0rNYpxJheK
	RWKUdHqEYpT+sEYvD0h+NwNzMCZPQ==
X-Received: by 2002:a05:6122:2187:b0:5c1:25d4:e29c with SMTP id 71dfb90a1353d-5c7ed0b2b83mr2319028e0c.0.1788520618527;
        Fri, 04 Sep 2026 04:16:58 -0700 (PDT)
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com. [209.85.221.179])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c7ec21302bsm1784482e0c.7.2026.09.04.04.16.56
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Sep 2026 04:16:57 -0700 (PDT)
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-5c663437fe5so416340e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 04 Sep 2026 04:16:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzsCcjtsKv5E1CO+b2W0p/fdLkNXg3Rtda62pS8u6/yJx7lG1jjmpBvPHhUysOzWb6TP3wNHByRSCZHEh4urxzT7w==@vger.kernel.org
X-Received: by 2002:a05:6102:6b01:b0:77b:b14e:b670 with SMTP id
 ada2fe7eead31-78a4aa0794emr1096677137.8.1788520616710; Fri, 04 Sep 2026
 04:16:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260902-rzg2-sr-boards-v4-0-4a456a422fee@solid-run.com>
 <20260902-rzg2-sr-boards-v4-2-4a456a422fee@solid-run.com> <CAD++jL=fGonMHd0jitwAE8+w=JYPX_6YFW6CzS9kRZLbx3045Q@mail.gmail.com>
 <0435939c-2836-480d-9ba2-8de4c5e22cc2@solid-run.com> <CAMuHMdUE3+qBdy2CoSQMzJ1iePiv0PSTfOjxHAqgp78i_XpMPQ@mail.gmail.com>
 <c0a37ff2-b133-4bd9-82c6-732f58e2c5ec@solid-run.com>
In-Reply-To: <c0a37ff2-b133-4bd9-82c6-732f58e2c5ec@solid-run.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 4 Sep 2026 13:16:44 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUOqA_mNQ6-+rxcTxiJSWDBQbiaLqYAtVEko6T7DLgOdg@mail.gmail.com>
X-Gm-Features: AcwNN1U-uc-LOk3gvbh_6tN7N3DFNnBp7J17BKaRTYV7o3lPeDqXkvPWiYvEkoY
Message-ID: <CAMuHMdUOqA_mNQ6-+rxcTxiJSWDBQbiaLqYAtVEko6T7DLgOdg@mail.gmail.com>
Subject: Re: [PATCH v4 2/7] dt-bindings: pinctrl: renesas,rzg2l-pinctrl: Allow
 input-enable pinconf
To: Josua Mayer <josua@solid-run.com>
Cc: Linus Walleij <linusw@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Benjamin Bara <benjamin.bara@skidata.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, Jon Nettleton <jon@solid-run.com>, 
	Mikhail Anikin <mikhail.anikin@solid-run.com>, Yazan Shhady <yazan.shhady@solid-run.com>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Josua,

On Fri, 4 Sept 2026 at 13:14, Josua Mayer <josua@solid-run.com> wrote:
> Am 04.09.26 um 12:12 schrieb Geert Uytterhoeven:
> > On Thu, 3 Sept 2026 at 11:23, Josua Mayer <josua@solid-run.com> wrote:
> >> Am 02.09.26 um 14:58 schrieb Linus Walleij:
> >>> On Wed, Sep 2, 2026 at 1:50=E2=80=AFPM Josua Mayer <josua@solid-run.c=
om> wrote:
> >>>> The list of allowed pinconf properties already includes input-enable=
,
> >>>> but has omitted input-disable.
> >>>>
> >>>> Both refer to the same hardware property, setting and clearing input=
-enable.
> >>>>
> >>>> Add input-disable to the list.
> >>>>
> >>>> Signed-off-by: Josua Mayer <josua@solid-run.com>
> >>> (...)
> >>>> +        input-disable: true
> >>> The Subject of this patch is  "Allow input-enable pinconf".
> >>>
> >>> But what you are doing is allowing input-disable.
> >>>
> >>> With the subject fixed:
> >>> Reviewed-by: Linus Walleij <linusw@kernel.org>
> >> Thanks!
> >> I'll fix the subject ... !
> >>
> >> ("dt-bindings: pinctrl: renesas,rzg2l-pinctrl: Allow input-disable pin=
conf")
> > No need to resend, I will fix this while applying
> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > i.e. will queue in renesas-pinctrl for v7.4.
> >
> > I will also add "output-disable", which is missing, too.
>
> Thanks!
>
> However I am ready to send v8. If I drop it my series will fail dtbs_chec=
k.
> Is it okay if I do resend it, and/or should I wait and cherry-pick your
> version
> so that it is easily dropped while applying without conflict?
>
> Or drop it and live with failing dtbs_check?

If you're ready, then please send v8 (and add "output-disable").
Thanks!

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
