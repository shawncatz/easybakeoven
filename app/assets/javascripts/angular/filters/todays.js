app.filter('todays', function() {
    return function(date) {
        if (!date) {
            return 'unknown'
        }
        moment.lang('en', {
            'calendar' : {
                lastDay : '[Yesterday]',
                sameDay : '[Today]',
                nextDay : '[Tomorrow]',
                lastWeek : '[last] dddd',
                nextWeek : 'dddd',
                sameElse : 'L'
            }
        });
        return moment(date).calendar();
    }
});
