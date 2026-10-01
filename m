Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FAD84F93B5
	for <linux-renesas-soc@vger.kernel.org>; Thu,  1 Oct 2026 11:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790854114; cv=pass; b=Va0vy9++TF67bvMLCQFpsjD3inAINJhcN3CA555sqWZZ/edkeLD9mZuosmosZrSHesieDc78/HENROJxyBsEU/K/G6g1Moi98yeQKb5H8PwnzUm3LxIUTInIi6iUNlsOmuSxZxC8eTyCAYAFH6IJZtlKasz0oiwoPnrnvibVuCQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790854114; c=relaxed/simple;
	bh=AwszME0PVQXG1C2Shl+TVih5js5vNu61zvf1dP2CyC0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MOzP2+QCfbsCfDgmMt8yLjUH4cA2VA/TnzIvlcjHzUEitsjasKeUUbhaK40LTzoZ0OswVMamKBjHCXByiPWnqeHNiFVX9nkUlSqHRAO2GtuuFNXyy3Rdv+q1Q+Aos3GR9gbslYBj+jO3MTY0IAwrFvmjJP0K20NUa7En5RPFj+U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hmRgA7XM; arc=pass smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hmRgA7XM"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f6350f89so3900260f8f.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 01 Oct 2026 04:28:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790854104; cv=none;
        d=google.com; s=arc-20260327;
        b=RpqltTP6NufuV0WKS420nW7xlslWZMSOjzi2Bf13UgPkgc+ufd/TJMUk14iun3q9yO
         DC9lyrBA2uuZwnhDOVgJ5mme+ZPixCkVFs7BMr/gwKP5sUQ/U1vh+SyrguBtO5ctmoVb
         Fxp6rb370CD2al2+uXhaSQTU/LI/UTK8hZ7pDSUa0kB9vd2H7rYFEMcNklXv+5I/jQcr
         6EzJu7uFkUFJYv5LaJBQwRmkNb9CPU3ZWd7BXMYZLERUnLTK7S2VLEfJEjzivT7VnBdV
         H+eWkAvMY06wtPRFMeyVMMHdbdgcmNG26ibTjCv+cqh5/Pp5s74TLHqbvMh2RXUWz4aU
         /wWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wlTXVZFyOCFbc+V/2yF4m7zDYgmRZl4N5AzvlwIj8Is=;
        fh=jL7H6CkFStWrqAsDuLDARpfvK1O7I+SEf9pB3hYqSYA=;
        b=OwrLPreQ5GgSG4+3u1XUWglrYZAavOvDj6hrWthXRdCYMaJzYiTEPR26DGuBgx7lpj
         HfXmNqOHDGBh9daz5D4EXXAxXY65y98rYEceGV4RI097fnBkx/lldcUtNN31Fpyw07fY
         RuCJUFcdeUBU+i7JSMg9OKkRFXmFBH4POTmMyYtozg56gqSMEMZfjmGZ6Klu95/0ZfiT
         PSIUcGLEVhTs2YmYT7wAbKQb9KSkKJqr9eb9NCN+9+y+XFDgyfwu8OoK9ojpK7m2GWUj
         W1vXAON4J+Y5FLmuqeVfEyxQAJ4GbRJGcZQ3OEFDWhVkTLB5I5O0bco3mRz9DI65tIty
         OzkA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790854104; x=1791458904; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wlTXVZFyOCFbc+V/2yF4m7zDYgmRZl4N5AzvlwIj8Is=;
        b=hmRgA7XMkdEUl5NDDcgnxH6nPHV45XbFOLCGcbW6yI+zubzTerjygoc2LBiwsmEZMY
         Z5sVoZc72Xc22ckzOZ2IJVDFOpxSGVn8Uw3mPLFJKbE6IX5hsi6ocKjWNa3VpPTIGEIw
         vEz4TFynFiB+apqfoP18RiyMc/TgfInaxGvebKBiwx/xzcccAcMXPsAKMX1/UChjKbVw
         jr47EM+HKDM9cvF29ONKb1phPGWuoZ2rawclhn93dovhH4dlbnsxXm/USeHV8OZpVdB5
         1bwQkcTF7V8nOyXeX1NfHfGV+hJj3iYn74DPrTPbdZVYztIEKyDhoADHfLlDaIm2iS8Z
         lE+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790854104; x=1791458904;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wlTXVZFyOCFbc+V/2yF4m7zDYgmRZl4N5AzvlwIj8Is=;
        b=uzjQDoVbYm9w2rQyyMpHom1eAyj8eYg2fdbLp09iUHAAPO0OOOrFbWZGzAnoZI0pHK
         fB0x0XFutYiZtsjtrls1FO6tbQ1nG4y+/MpZKXMtA0KxKJ+VLdSuKs923qfw4jTD9ozY
         7+UW5uEUB0RpqW/5l7V+7svFu8x0oCUBAYQppskobSJesaEedtNrVuHb7tAwg/Xym+gn
         fT7MUoPkUFjEZmYDGSv9Xo5Ft//xL8wn6h3q5i9E303s3BtE/NL6l9rzcqoCMs3NsNHY
         OxJGYYcCCxeq3u4/u8+PlkZiqoOm1iYdnZdX1Te6nFKqlaPT+kykzFZoxC1Ns8L54cwM
         CVww==
X-Forwarded-Encrypted: i=1; AKwUvByc6lpRYIVr10SDflzp0tVWXVW5qeqfi0B4onWL4O6V81UnUyRyexPGJex4RaZbms6FCwtCO5os+UURnJOLGmBYHg==@vger.kernel.org
X-Gm-Message-State: AFq9FYIZvkoax4LdPU3lU6iLjZi0XJ0G6gajLF51C92FcYyStUjWQNYJ
	6aglTOHuUgNRHISwb4bvlzVyMN3dQhB12h8NM6l19OLzpPsfs0lSJnptau4tmWMdD1+nV0LvUOQ
	RrwC69LSHTAryaf+9hhlYoYtP+HyQWSH5hBNHvL4=
X-Gm-Gg: AYBFou2N+UnFSjUafeHvzPI+2O+4UHzpqoPIG/DYZbfhevh1Z34Jjs25SnqcWkWynsb
	6hap1/QFeS5XLLcxvtnIH16Zs9k+ooWgtpfUEPQEc24sAINgxXQx4z3nNAB+HkNRhNm7FdOvXGN
	ybFN8rQl+FbfW68ch9RHbPsN5Z15pCBt0aafKe+2QZqmK1o3k5fcE1LPCQn74Bdrw+96T481fXc
	8ndhvqgX8fZ9jbq+7jQO73bZP/B0yaa119QruDyRI9ci2e4WQUnMvtsb7+qRLbKsNjEcFF+4pJZ
	2qZEd/XrCkoJ9R+s/1RVC/YlU98vllLanA0seNXicQNI6YT6obHTYyKCLJZx1qUpH7Rtk/F4Y4j
	6m7jxaBrtx0kKd6BYFiqXUcqMqwWCw0crQrASxG1d8kAEF+wwMFlOk6MwrYtnJAKd/StWXWHfAg
	==
X-Received: by 2002:a05:6000:290c:b0:48a:fcf8:20d1 with SMTP id
 ffacd0b85a97d-48b02550600mr8872303f8f.48.1790854103827; Thu, 01 Oct 2026
 04:28:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260928-miic-validate-dtb-v2-0-1ee3d33748e9@reliablecontrols.com>
 <20260928-miic-validate-dtb-v2-1-1ee3d33748e9@reliablecontrols.com>
In-Reply-To: <20260928-miic-validate-dtb-v2-1-1ee3d33748e9@reliablecontrols.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 1 Oct 2026 12:27:56 +0100
X-Gm-Features: AclHuK8F6U7l3QWG93hRCdan52bWlrmjNJx7o9EjG92O3k2nxmSLT0XW8-w3RDA
Message-ID: <CA+V-a8uGauEQZD4dT7woBmg4b0dqgvWNQ7JCdCgpf4U=aZ0X-Q@mail.gmail.com>
Subject: Re: [PATCH net-next v2 1/3] net: pcs: rzn1-miic: Fix port numbering
 on RZ/T2H
To: khendry@reliablecontrols.com
Cc: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>, 
	Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Kyle,

Thank you for the patch.

On Mon, Sep 28, 2026 at 10:19=E2=80=AFPM Kyle Hendry via B4 Relay
<devnull+khendry.reliablecontrols.com@kernel.org> wrote:
>
> From: Kyle Hendry <khendry@reliablecontrols.com>
>
> The port numbers on the RZ/T2H are documented as 0 to 3. Update the info
> structure to reflect this.
>
> Fixes: 08f89e42121d421b ("net: pcs: rzn1-miic: Add RZ/T2H MIIC support")
> Signed-off-by: Kyle Hendry <khendry@reliablecontrols.com>
> ---
>  drivers/net/pcs/pcs-rzn1-miic.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/net/pcs/pcs-rzn1-miic.c b/drivers/net/pcs/pcs-rzn1-m=
iic.c
> index cb74861e823c..df70309c2d97 100644
> --- a/drivers/net/pcs/pcs-rzn1-miic.c
> +++ b/drivers/net/pcs/pcs-rzn1-miic.c
> @@ -838,7 +838,7 @@ static struct miic_of_data rzt2h_miic_of_data =3D {
>         .index_to_string =3D rzt2h_index_to_string,
>         .index_to_string_count =3D ARRAY_SIZE(rzt2h_index_to_string),
>         .miic_port_start =3D 0,
> -       .miic_port_max =3D 4,
> +       .miic_port_max =3D 3,
The description for miic_port_max in struct miic_of_data needs
updating. I would suggest renaming this variable to miic_port_last.

Cheers,
Prabhakar

>         .sw_mode_mask =3D GENMASK(2, 0),
>         .reset_ids =3D rzt2h_reset_ids,
>         .reset_count =3D ARRAY_SIZE(rzt2h_reset_ids),
>
> --
> 2.43.0
>
>
>
