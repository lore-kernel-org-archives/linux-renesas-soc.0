Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70E244AA572
	for <linux-renesas-soc@vger.kernel.org>; Thu, 17 Sep 2026 10:24:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789640667; cv=none; b=DKGAA762OSZlweH8oCGi6V23/5qbSzwn5io4ZeeZZi8CMXOv87qnXI8+wBims9W6+SHoArqg99rIxxRTs39wfcC5NppBf3Q+o541mMFDbzWbZEZ0BcTgIaMwh713j9pjJlw9sVb7H2FqftMOLMw8iU7XXR+UgKpVyfgC3HmQEfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789640667; c=relaxed/simple;
	bh=762E052nR6gGTPVlP3jXRnIHa37N63QsOBfYo0kz2MQ=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=RuWwpfn2/UQX645yoa8MfUpjGd6VOc1D41iZwMIxrcb/B76DuuPer5qqRoBGQQyWbNNKqSznOHwNqjI0jgcs21iF7LJywBaoVvotyr5LzZXyQw5SH6aFtI2FZYzfTLHSMvv5/QjIWdL4wOwg1c4/Q6078TjNVI8ZMQrCGYQyjOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=tgPhBj1N; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="tgPhBj1N"
Received: from neptunite.rasen.tech (unknown [IPv6:2400:2411:160:2f00:a4f1:7e05:2192:a835])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 882592C6;
	Thu, 17 Sep 2026 12:22:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1789640560;
	bh=762E052nR6gGTPVlP3jXRnIHa37N63QsOBfYo0kz2MQ=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=tgPhBj1N9BvnrJHykaoFgZwgqlHpjvVUGyFOlDQYj8GBjlp1Oqf3rRDa/c8zqZ9xc
	 eaPtsrT9+CjhRF/y0UAM51j1yO8dJie2RQU4MYJOpomQ8xkBHLM4W2/+T8iYwVlqlP
	 +m87E96n+paMP9riHfg5cyZd0SilnHiKiUPvrzJw=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260916235648.261920-2-laurent.pinchart+renesas@ideasonboard.com>
References: <20260916235648.261920-1-laurent.pinchart+renesas@ideasonboard.com> <20260916235648.261920-2-laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [vsp-tests] [PATCH 1/4] Use lowercase for all shell script variables
From: Paul Elder <paul.elder@ideasonboard.com>
Cc:
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, linux-renesas-soc@vger.kernel.org
Date: Thu, 17 Sep 2026 19:24:16 +0900
Message-ID: <178964065610.52643.11907999068428461175@neptunite.rasen.tech>
User-Agent: alot/0.0.0

Quoting Laurent Pinchart (2026-09-17 08:56:45)
> The vast majority of shell script variables are in lowercase, but a
> handful still use uppercase. Use lowercase everywhere for consistency.
>=20
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.co=
m>

Reviewed-by: Paul Elder <paul.elder+renesas@ideasonboard.com>

> ---
>  scripts/bin2png.sh   | 12 ++++++------
>  scripts/logger.sh    |  6 +++---
>  scripts/vsp-tests.sh |  4 ++--
>  3 files changed, 11 insertions(+), 11 deletions(-)
>=20
> diff --git a/scripts/bin2png.sh b/scripts/bin2png.sh
> index e7b16ee6288b..e5cb01088687 100755
> --- a/scripts/bin2png.sh
> +++ b/scripts/bin2png.sh
> @@ -2,7 +2,7 @@
>  # SPDX-License-Identifier: GPL-2.0-or-later
>  # SPDX-FileCopyrightText: 2016-2017 Renesas Electronics Corporation
> =20
> -FILE=3D${1:-.}
> +file=3D${1:-.}
> =20
>  convert_image() {
>         local file=3D$1
> @@ -29,14 +29,14 @@ convert_image() {
>         rm $ppm
>  }
> =20
> -if [ -d $FILE ] ; then
> -       if [ $(ls $FILE/vsp-unit-test-00*-*frame*.bin 2>/dev/null | wc -l=
) !=3D 0 ] ; then
> -               for f in $FILE/vsp-unit-test-00*-*frame*.bin ; do
> +if [ -d $file ] ; then
> +       if [ $(ls $file/vsp-unit-test-00*-*frame*.bin 2>/dev/null | wc -l=
) !=3D 0 ] ; then
> +               for f in $file/vsp-unit-test-00*-*frame*.bin ; do
>                         convert_image $f
>                 done
>         fi
> -elif [ -f $FILE ] ; then
> -       convert_image $FILE
> +elif [ -f $file ] ; then
> +       convert_image $file
>  else
>         echo "Usage: $0 <file or directory>"
>  fi
> diff --git a/scripts/logger.sh b/scripts/logger.sh
> index 75426a51961a..fd9f5485c180 100755
> --- a/scripts/logger.sh
> +++ b/scripts/logger.sh
> @@ -4,9 +4,9 @@
> =20
>  label=3D${1:+ [$1]}
> =20
> -TRACE_MARKER=3D/sys/kernel/debug/tracing/trace_marker
> -if [ -e $TRACE_MARKER ] && [ "$(id -u)" =3D 0 ]; then
> -       ./monotonic-ts "$label" | tee -a $TRACE_MARKER
> +trace_marker=3D/sys/kernel/debug/tracing/trace_marker
> +if [ -e $trace_marker ] && [ "$(id -u)" =3D 0 ]; then
> +       ./monotonic-ts "$label" | tee -a $trace_marker
>  else
>         ./monotonic-ts "$label"
>  fi
> diff --git a/scripts/vsp-tests.sh b/scripts/vsp-tests.sh
> index 13e7ba4410b5..765ec08273c3 100755
> --- a/scripts/vsp-tests.sh
> +++ b/scripts/vsp-tests.sh
> @@ -18,7 +18,7 @@
>  ##   n: Number of iterations to execute test suite
>  ##
> =20
> -KERNEL_VERSION=3D`uname -r`
> +kernel_version=3D`uname -r`
> =20
>  run_test() {
>         local script=3D$1
> @@ -44,7 +44,7 @@ run_test() {
>         done
> =20
>         if [ $(ls *.bin 2>/dev/null | wc -l) !=3D 0 ] ; then
> -               local dir=3D$KERNEL_VERSION/test-$script/$iteration/
> +               local dir=3D$kernel_version/test-$script/$iteration/
> =20
>                 mkdir -p $dir
>                 mv *.bin $dir
> --=20
> Regards,
>=20
> Laurent Pinchart
>
